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
    
    @Published var duration = 0
    @Published var size = 1.0
    @Published var difficulty = 1.0
    
    @Published var brown = false
    @Published var orange = false
    @Published var yellow = false
    @Published var green = false
    @Published var booger = false
    
    @Published var smooth = false
    @Published var soft = false
    @Published var watery = false
    @Published var sticky = false
    @Published var fluffy = false
    @Published var lumpy = false
    @Published var mushy = false
    
}
