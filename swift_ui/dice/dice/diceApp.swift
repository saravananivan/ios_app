//
//  diceApp.swift
//  dice
//
//  Created by Mac on 2/22/23.
//

import SwiftUI

@main
struct diceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(leftDiceNumber: 1, rightDiceNumber: 1)
        }
    }
}
