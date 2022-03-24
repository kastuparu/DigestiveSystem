//
//  DayView.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/22/22.
//

import SwiftUI

struct DayView: View {
    
    var day: Day
    
    var body: some View {
        
        HStack {
            
            Text(day.dateString)
                .font(.title3)
            
            Spacer()
            
            if day.foodEntries.count > 0 {
                Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            else {
                Image("").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            
            if day.stoolEntries.count > 0 {
                Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            else {
                Image("").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(12)
    }
}

struct DayView_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        DayView(day: day)
    }
}
