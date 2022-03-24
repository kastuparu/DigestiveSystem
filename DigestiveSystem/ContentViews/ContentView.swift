//
//  ContentView.swift
//  Shared
//
//  Created by Katy Stuparu on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var day = Day()
    @StateObject var dayList = DayList()
    
    var body: some View {
        
        TabView {
            
            Home()
                .environmentObject(day)
                .tabItem() {
                    Image(systemName: "house").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    Text("Home")
            }
            
            Calendar()
                .environmentObject(dayList)
                .tabItem() {
                    Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    Text("Calendar")
            }
            
            // Image(systemName: "chart.line.uptrend.xyaxis").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
            // Image(systemName: "book").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
            // Image(systemName: "slider.horizontal.3").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
