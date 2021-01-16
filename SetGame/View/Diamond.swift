//
//  Diamond.swift
//  Set Game
//
//  Created by Amirala on 9/22/1399 AP.
//

import SwiftUI

struct Diamond: Shape {

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let upperCorner = CGPoint(x: center.x, y: rect.maxY)
        let leftCorner = CGPoint(x: rect.minX, y: center.y)
        let buttomCorner = CGPoint(x: center.x, y: rect.minY)
        let rightCorner = CGPoint(x: rect.maxX, y: center.y)
        var p = Path()
        p.move(to: upperCorner)
        p.addLine(to: leftCorner)
        p.addLine(to: buttomCorner)
        p.addLine(to: rightCorner)
        p.addLine(to: upperCorner)
        return p
    }
}
