//
//  StoolEntry.swift
//  digestivesystem
//
//  Created by Katy Stuparu on 3/15/22.
//

import Foundation

class Entry: ObservableObject {
    @Published var date = Date()
    @Published var notes = ""
}

class FoodEntry: ObservableObject {
    
    @Published var date = Date()
    @Published var duration = 0
    @Published var size = 1.0
    @Published var notes = ""
    
    @Published var probiotics = false
    @Published var collagens = false
    @Published var garliconion = false
    @Published var processed = false
    @Published var spicy = false
    @Published var highsugar = false
    
    @Published var grains = ""
    @Published var protein = ""
    @Published var vegetables = ""
    @Published var fruits = ""
    @Published var dairy = ""
    
    func foodToInt(food: String) -> Int {
        return Int(food.dropLast()) ?? -1
    }
    
    func foodSum() -> Int {
        return foodToInt(food: grains) + foodToInt(food: protein) + foodToInt(food: vegetables) + foodToInt(food: fruits) + foodToInt(food: dairy)
    }
    
}

class StoolEntry {
    
    var date = Date()
    var duration = 0
    var size = 1.0
    var difficulty = 1.0
    var notes = ""
    
    var brown = false
    var orange = false
    var yellow = false
    var green = false
    var booger = false
    
    var smooth = false
    var soft = false
    var watery = false
    var sticky = false
    var fluffy = false
    var lumpy = false
    var mushy = false
    
}
