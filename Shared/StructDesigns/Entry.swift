//
//  StoolEntry.swift
//  digestivesystem
//
//  Created by Katy Stuparu on 3/15/22.
//

import Foundation

protocol Entry {
    var date : Date { get set }
    var notes : String { get set }
}

extension Entry {

    static func parseVehicleFields(jsonDict: [String:Any]) -> (Date, String) {
        let date = jsonDict["date"] as! Date
        let notes = jsonDict["notes"] as! String
        return (date, notes)
    }
}


struct FoodEntry {
    
    var date = Date()
    var duration = 0
    var size = 0
    var notes = ""
    
    var probiotics = false
    var collagens = false
    var garliconion = false
    var processed = false
    var spicy = false
    var highsugar = false
    
}

struct StoolEntry {
    
    var date = Date()
    var duration = 0
    var size = 0
    var difficulty = 0
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
