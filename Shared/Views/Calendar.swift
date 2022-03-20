//
//  Calendar.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct Calendar: View {
    
    @EnvironmentObject var day: Day
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack {
                    
                    Text("Previous Entries")
                        .font(.title)
                    
                    // RecyclerView with all previous entries
                    
                    HStack {
                        
                        Text("February 26, 2022")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                        
                        Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                        
                    }
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    .cornerRadius(12)
                    
                    HStack {
                        
                        Text("February 25, 2022")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                        
                        Image("").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                        
                    }
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    .cornerRadius(12)
                }
            }
        }
        .padding(.all)
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
