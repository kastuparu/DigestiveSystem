//
//  DayList.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/22/22.
//

import Foundation

class DayList: ObservableObject {
    
    @Published var list = [Day(date: Date(timeIntervalSinceNow: -86400)), Day(date: Date())]
    
    func getIndex(id: UUID) -> Int {
        for i in 0...list.count - 1 {
            if id.uuidString == list[i].id.uuidString {
                return i
            }
        }
        return -1
    }
}
