//
//  GeometricCard.swift
//  SetGame
//
//  Created by Amirala on 9/24/1399 AP.
//

import Foundation

struct GeometricCard: SetCard {
    
    var featureA: Number { number }
    var featureB: Shape { shape }
    var featureC: Shade { shade }
    var featureD: CardColor { cardColor }
    
    var number: Number
    var shape: Shape
    var shade: Shade
    var cardColor: CardColor
    
    var isSelected: Bool = false
    var isMatched: Bool = false
    var isDismatched: Bool = false
    var isOnTable: Bool = false

    var id: Int
    
    static func generateAll() -> [Self] {
        var cards = [Self]()
        var id = 0
        for number in Number.allCases {
            for shape in Shape.allCases {
                for shade in Shade.allCases {
                    for color in CardColor.allCases {
                        cards.append(GeometricCard(number: number, shape: shape, shade: shade, cardColor: color, id: id))
                        id += 1
                    }
                }
            }
        }
        return cards
    }
    
    
    enum Number: Int, CaseIterable, CardFeature {
        typealias Content = Self
        case one = 1, two, three
    }
    
    enum Shape: CaseIterable, CardFeature {
        typealias Content = Self
        case diamond, rectangle, oval
    }
    
    enum Shade: CaseIterable, CardFeature {
        typealias Content = Self
        case solid, striped, open
    }
    
    enum CardColor: CaseIterable, CardFeature {
        typealias Content = Self
        case red, green, blue
    }
}
