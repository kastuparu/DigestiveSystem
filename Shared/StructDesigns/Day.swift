//
//  Day.swift
//  digestivesystem
//
//  Created by Katy Stuparu on 3/15/22.
//

import Foundation

struct Day {
    
    var date = Date()
    
    func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from : date)
    }
    
    var sleep = ""
    var hydration = ""
    var exercise = ""
    var stress = ""
    
    var notes = ""
    
    var entries : [Entry] = []
    
}
