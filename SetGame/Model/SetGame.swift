//
//  SetGame.swift
//  Set Game
//
//  Created by Amirala on 9/22/1399 AP.
//

import Foundation


struct SetGame<Card> where Card: SetCard {
//    private(set) var cards: [Card]
    private(set) var deck: [Card]
//    private(set) var onTableCards: [Card] { cards.filter { $0.isOnTable }}
    private(set) var inGameCards: [Card]
    private(set) var discardPile: [Card]
    private var selectedCards: [Card] { inGameCards.filter { $0.isSelected } }
    
    init(cards: [Card]) {
//        self.cards = cards.shuffled()
//        deck = self.cards
        deck = cards.shuffled()
        inGameCards = []
        discardPile = []
    }
    
    mutating func dealCards(_ number: Int = 3) {
        guard number < deck.count else { return }
        if selectedCards.count == 3, selectedCards[0].isMatched {
            for _ in 0..<3 {
                replaceFromDeck(card: selectedCards[0])
            }
        } else {
            for _ in 0..<number {
                let card = deck.removeFirst()
//                let index = cards.firstIndex(matching: card)!
//                cards[index].isOnTable = true
                inGameCards.append(card)
            }
        }
    }
    
    mutating func choose(card: Card) {
        if selectedCards.count < 3 {
            toggle(card: card)
            if selectedCards.count == 3 {
                if Card.isSet(cards: selectedCards) {
                    markMatch()
                } else {
                    markDismatch()
                }
            }
        } else {
            let selectedCardsCopy = selectedCards
            if selectedCards[0].isMatched {
                if deck.count >= 3 {
                    for _ in 0..<3 {
                        replaceFromDeck(card: selectedCards[0])
                    }
                } else {
                    for card in selectedCards {
                        flyOut(card: card)
                    }
                }
                clearMarks()
                if !selectedCardsCopy.contains(card) {
                    toggle(card: card)
                }
            } else {
                clearMarks()
                toggle(card: card)
            }
        }
    }
    
    private mutating func clearMarks() {
        for index in inGameCards.indices {
            inGameCards[index].isSelected = false
            inGameCards[index].isMatched = false
            inGameCards[index].isDismatched = false
        }
    }
    
    private mutating func flyOut(card: Card) {
        let indexOfOldCard = inGameCards.firstIndex(matching: card)!
        inGameCards.remove(at: indexOfOldCard)
        discardPile.append(card)
//        let index = inga.firstIndex(matching: card)!
//        cards[index].isOnTable = false
//        cards[index].isDiscarded = true
    }
    
    private mutating func toggle(card: Card) {
        let index = inGameCards.firstIndex(matching: card)!
        inGameCards[index].isSelected.toggle()
    }
    
    private mutating func replaceFromDeck(card: Card) {
        let indexOfOldCard = inGameCards.firstIndex(matching: card)!
        flyOut(card: card)
        let newCard = deck.removeFirst()
        inGameCards.insert(newCard, at: indexOfOldCard)
//        let indexOfOldCard = cards.firstIndex(matching: card)!
//        flyOut(card: card)
//        let newCard = deck.removeFirst()
//        let indexOfNewCard = cards.firstIndex(matching: newCard)!
//        cards[indexOfNewCard].isOnTable = true
//        cards[indexOfNewCard].isDealt = true
//        cards.swapAt(indexOfOldCard, indexOfNewCard)
////        onTableCards.remove(at: indexOnTable)
////        onTableCards.insert(newCard, at: indexOnTable)
////        onTableCards[onTableCards.firstIndex(matching: newCard)!].isOnTable = true
////        discardedCards.append(card)
    }
    
    private mutating func markMatch() {
        for card in selectedCards {
            inGameCards[inGameCards.firstIndex(matching: card)!].isMatched = true
        }
    }

    private mutating func markDismatch() {
        for card in selectedCards {
            inGameCards[inGameCards.firstIndex(matching: card)!].isDismatched = true
        }
    }

}
