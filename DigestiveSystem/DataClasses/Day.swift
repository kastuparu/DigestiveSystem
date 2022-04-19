//
//  Day.swift
//  digestivesystem
//
//  Created by Katy Stuparu on 3/15/22.
//

import Foundation

class Day: ObservableObject, Identifiable {
    
    init(date: Date) {
        self.date = date
    }
    
    let id = UUID()
    
    let date: Date
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from : date)
    }
    
    @Published var grains = 20.0
    @Published var protein = 20.0
    @Published var vegetables = 20.0
    @Published var fruits = 20.0
    @Published var dairy = 20.0
    
    @Published var sleep = ""
    @Published var hydration = ""
    @Published var exercise = ""
    @Published var stress = ""
    
    @Published var notes = ""
    
    var entries: [Entry] {
        
        let unsortedEntries = foodEntries + stoolEntries
        
        return unsortedEntries.sorted(by: {
            $0.date.compare($1.date) == .orderedAscending
        })
    }
    
    func getIndex(id: UUID, typeFood: Bool) -> Int {
        
        if typeFood {
            for i in 0...foodEntries.count - 1 {
                if id == self.foodEntries[i].id {
                    return i
                }
            }
        }
        else {
            for i in 0...stoolEntries.count - 1 {
                if id == self.stoolEntries[i].id {
                    return i
                }
            }
        }
        return -1
    }
    
    @Published var foodEntries = [FoodEntry]()
    
    @Published var stoolEntries = [StoolEntry]()
    
    
}
