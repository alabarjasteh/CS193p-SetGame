//
//  ContentView.swift
//  SetGame
//
//  Created by Amirala on 9/24/1399 AP.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        VStack {
            
            Grid(viewModel.inGameCards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.choose(card: card)
                    }
                }
                .aspectRatio(0.67, contentMode: .fit)
                .padding(5)
            }
            .padding()
            .onAppear {
                withAnimation(Animation.easeInOut.delay(0.5)) {
                    viewModel.dealCards(12)
                }
            }
            
            Button("Deal 3 more Cards!") {
                withAnimation(.easeInOut) {
                    viewModel.dealCards(3)
                }
            }
            .font(.title)
            
            Button("New Game") {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                    viewModel.dealCards(12)
                }
            }
            
        }
    }
}

struct CardView: View {
    var card: GeometricCard
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
//        if card.isOnTable {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius*size.width)
                    .fill(card.isMatched ? Color.green : Color.white)
                    .opacity(card.isDismatched ? 0 : 0.2)
                    .animation(card.isMatched ? Animation.linear : .default)
                RoundedRectangle(cornerRadius: cornerRadius*size.width)
                    .fill(card.isDismatched ? Color.red : Color.white)
                    .opacity(card.isMatched ? 0 : 0.2)
                    .animation(card.isDismatched ? Animation.linear.repeatCount(5) : .default)
                RoundedRectangle(cornerRadius: cornerRadius*size.width)
                    .stroke(lineWidth: card.isSelected ? edgeLineWidth*2 : edgeLineWidth)
                    .foregroundColor(card.isSelected ? .blue : .black)
                FigureBuilderView(card: card, size: size)
                    .padding(padding*size.width)
            }
            .transition(.offset(x: 500, y: 300))
//        }
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 0.1
    private let edgeLineWidth: CGFloat = 2.0
    private let padding: CGFloat = 0.1
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let game = SetGameViewModel()
//        return ContentView(viewModel: game)
//    }
//}
