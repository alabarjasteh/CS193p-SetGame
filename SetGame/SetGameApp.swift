//
//  SetGameApp.swift
//  SetGame
//
//  Created by Amirala on 9/24/1399 AP.
//

import SwiftUI

@main
struct SetGameApp: App {
    @StateObject var viewModel = SetGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
