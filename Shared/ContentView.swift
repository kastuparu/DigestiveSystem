//
//  ContentView.swift
//  Shared
//
//  Created by Katy Stuparu on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var day = Day()
    
    var body: some View {
        TabView {
            
            Home()
                .environmentObject(day)
                .tabItem() {
                    Image(systemName: "house").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    Text("Home")
            }
            
            Calendar()
                .environmentObject(day)
                .tabItem() {
                    Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    Text("Calendar")
            }
            
            // Image(systemName: "chart.line.uptrend.xyaxis").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
            // Image(systemName: "book").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
            // Image(systemName: "slider.horizontal.3").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
            
        }
        .environmentObject(day)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let day = Day()
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(day)
            ContentView()
                .environmentObject(day)
            ContentView()
                .environmentObject(day)
        }
    }
}
