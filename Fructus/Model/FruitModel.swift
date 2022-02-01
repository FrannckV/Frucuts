//
//  FruitModel.swift
//  Fructus
//
//  Created by Frannck Villanueva on 01/12/21.
//

import SwiftUI

// MARK: - FRUITS DATAMODEL

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
