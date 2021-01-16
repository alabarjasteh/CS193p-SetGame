//
//  FigureBuilderView.swift
//  SetGame
//
//  Created by Amirala on 9/24/1399 AP.
//

import SwiftUI

struct FigureBuilderView: View {
    var card: GeometricCard
    var size: CGSize
    var color: Color {
        switch card.cardColor {
        case .green:
            return .green
        case .red:
            return .red
        case .blue:
            return .blue
        }
    }
    var shading: Double {
        switch card.shade {
        case .open:
            return 0
        case .striped:
            return 0.1
        case .solid:
            return 1
        }
    }

    var body: some View {
        VStack {
            ForEach(0..<card.number.rawValue) { _ in
                ZStack {
                    Group {
                        if card.shape == .diamond {
                            Diamond()
                        } else if card.shape == .oval {
                            Capsule()
                        } else {
                            Rectangle()
                        }
                    }
                    .foregroundColor(.white)
                    
                    Group {
                        if card.shape == .diamond {
                            Diamond()
                        } else if card.shape == .oval {
                            Capsule()
                        } else {
                            Rectangle()
                        }
                    }
                    .opacity(shading)
                    
                    Group {
                        if card.shape == .diamond {
                            Diamond().stroke(lineWidth: lineWidth)
                        } else if card.shape == .oval {
                            Capsule().stroke(lineWidth: lineWidth)
                        } else {
                            Rectangle().stroke(lineWidth: lineWidth)
                        }
                    }
                }
                .frame(width: size.width*0.8, height: size.height/5, alignment: .center)
                .foregroundColor(color)
            }
        }
    }
    
    
    // MARK: - Drawing Constants
    private var lineWidth: CGFloat { 0.03 * size.width }
}
