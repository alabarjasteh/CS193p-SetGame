//
//  SGViewModel.swift
//  Set Game
//
//  Created by Amirala on 9/22/1399 AP.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame<GeometricCard>
    
    private static func createSetGame() -> SetGame<GeometricCard> {
        let cards = GeometricCard.generateAll()
        return SetGame<GeometricCard>(cards: cards)
    }

    init() {
        model = SetGameViewModel.createSetGame()
    }
    
    
    // MARK: - Access to the model
    
    var inGameCards: [GeometricCard] {
        model.inGameCards
    }
    
    
    // MARK: - Intents
    
//    func choose(card: Card) {
//        model.choose(card: card)
//    }

    func dealCards(_ number: Int) {
        model.dealCards(number)
    }
    
    func resetGame() {
        model = SetGameViewModel.createSetGame()
    }
    
    func choose(card: GeometricCard) {
        model.choose(card: card)
    }
    
}
