//
//  Calendar.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct Calendar: View {
    
    @EnvironmentObject private var dayList: DayList
    
    @State private var uiTabarController: UITabBarController?
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(dayList.list) { day in
                    DayView(day: day)
                }
                .listStyle(SidebarListStyle())
            }
            .navigationBarTitle("Calendar", displayMode: .inline)
        }
        .environmentObject(dayList)
        .introspectTabBarController { (UITabBarController) in
                    UITabBarController.tabBar.isHidden = true
                    uiTabarController = UITabBarController
                }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var dayList = DayList()
    static var previews: some View {
        Calendar()
            .environmentObject(dayList)
    }
}
