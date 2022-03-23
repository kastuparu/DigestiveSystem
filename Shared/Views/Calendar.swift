//
//  Calendar.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct Calendar: View {
    
    @ObservedObject var dayList: DayList
    
    init(dayList: DayList) {
        self.dayList = dayList
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack {
            Text("Previous Entries")
                .font(.title)
                .padding(.all)
            
            List(dayList.list) { day in
                DayView(day: day)
            }
            .listStyle(SidebarListStyle())
        }
        .environmentObject(dayList)
    }
}

struct Calendar_Previews: PreviewProvider {
    static var dayList = DayList()
    static var previews: some View {
        Calendar(dayList: dayList)
            .environmentObject(dayList)
    }
}
