//
//  SetCard.swift
//  SetGame
//
//  Created by Amirala on 9/24/1399 AP.
//

import Foundation

protocol SetCard: Equatable, Identifiable {
    
    associatedtype FeatureA: CardFeature
    associatedtype FeatureB: CardFeature
    associatedtype FeatureC: CardFeature
    associatedtype FeatureD: CardFeature
    
    var featureA: FeatureA { get }
    var featureB: FeatureB { get }
    var featureC: FeatureC { get }
    var featureD: FeatureD { get }
    
    var isSelected: Bool { get set }
    var isMatched: Bool { get set }
    var isDismatched: Bool { get set }
//    var isOnTable: Bool { get set }
    
    var id: Int { get set }
}

extension SetCard {
    static func isSet(cards: [Self]) -> Bool {
        guard cards.count == 3 else { return false }
        let setsByFeatures = [
            FeatureA.isCorrectSet(content1: cards[0].featureA, content2: cards[1].featureA, content3: cards[2].featureA),
            FeatureB.isCorrectSet(content1: cards[0].featureB, content2: cards[1].featureB, content3: cards[2].featureB),
            FeatureC.isCorrectSet(content1: cards[0].featureC, content2: cards[1].featureC, content3: cards[2].featureC),
            FeatureD.isCorrectSet(content1: cards[0].featureD, content2: cards[1].featureD, content3: cards[2].featureD)
        ]
        
        // only if all are correct sets
        return setsByFeatures.reduce(true) { $0 && $1 }
    }
}


protocol CardFeature: Equatable {
    associatedtype Content
}

extension CardFeature {
    static func isCorrectSet<Content: Equatable>(content1: Content, content2: Content, content3: Content) -> Bool {
        return (content1 == content2 && content1 == content3) ||
            (content1 != content2 && content2 != content3 && content1 != content3)
    }
}
