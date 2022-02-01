//
//  FructusApp.swift
//  Fructus
//
//  Created by Frannck Villanueva on 30/11/21.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView(fruits: fruitsData)
            } else {
                ContentView()
            }
        }
    }
}
