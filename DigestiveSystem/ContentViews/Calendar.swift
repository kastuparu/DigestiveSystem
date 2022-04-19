//
//  Calendar.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct Calendar: View {
    
    @EnvironmentObject private var dayList: DayList
    
    @State private var selectedDay: Day? = nil
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    ForEach(dayList.list) { day in
                        
                        Button(action: {
                            selectedDay = day
                        }) {
                          DayView(day: day)
                        }
                    }
                    
                    Spacer()
                    
                }
                .sheet(item: self.$selectedDay) { day in
                    let i = dayList.getIndex(id: day.id)
                    DailySummary(dayIndex: i)
                }
                .padding(.all)
            }
            .navigationBarTitle("Calendar")
        }
        
        .environmentObject(dayList)
    }
}

struct Calendar_Previews: PreviewProvider {
    static var dayList = DayList()
    static var previews: some View {
        Calendar()
            .environmentObject(dayList)
    }
}
