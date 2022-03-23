//
//  StoolEntry.swift
//  digestivesystem
//
//  Created by Katy Stuparu on 3/15/22.
//

import Foundation

class Entry: ObservableObject, Identifiable {
    
    let id = UUID()
    
    var food: Bool {
        return self is FoodEntry
    }

    @Published var date = Date()
    
    var timeStamp: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from : date)
    }
    
    @Published var notes = "notes"
    var shortNotes: String {
        if notes.count > 11 {
            return notes.prefix(9) + "..."
        }
        else {
            return notes
        }
    }
    
}

class FoodEntry: Entry {
    
    @Published var duration = 0
    @Published var size = 1.0
    
    @Published var probiotics = false
    @Published var collagens = false
    @Published var garliconion = false
    @Published var processed = false
    @Published var spicy = false
    @Published var highsugar = false
    
    @Published var grains = "0%"
    @Published var protein = "0%"
    @Published var vegetables = "0%"
    @Published var fruits = "0%"
    @Published var dairy = "0%"
    
    func foodToInt(food: String) -> Int {
        return Int(food.dropLast()) ?? -1
    }
    
    func foodSum() -> Int {
        return foodToInt(food: grains) + foodToInt(food: protein) + foodToInt(food: vegetables) + foodToInt(food: fruits) + foodToInt(food: dairy)
    }
    
}

class StoolEntry: Entry {
    
    var duration = 0
    var size = 1.0
    var difficulty = 1.0
    
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
