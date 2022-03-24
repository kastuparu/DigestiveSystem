//
//  DayList.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/22/22.
//

import Foundation

class DayList: ObservableObject, Identifiable {
    
    let id = UUID()
    
    @Published var list = [Day(), Day(), Day()]
    
}
