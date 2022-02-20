//
//  Home.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            
            Text("App Name")
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack {
                    
                VStack {
                        
                    Text("February 26, 2022")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        
                    Text("Today's Summary")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    
                HStack {
                        
                    // Replace with food chart
                    Image("Home2").resizable().aspectRatio(contentMode: .fit)
                        
                    VStack {
                            
                        Text("Track today's heath habits")
                            .foregroundColor(Color.red)
                        
                        Button(action: {}) {
                            Text(">>>")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                            
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25)
            .stroke(Color.black, lineWidth: 5)
            .frame(maxHeight: .infinity))
                
            Spacer()
                
            Button(action: {}) {
                HStack {
                    Text("Track Food Eaten")
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
            .cornerRadius(12)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                
            Spacer()
                
            Button(action: {}) {
                HStack {
                    Text("Track Gut Conditions")
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
            .cornerRadius(12)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                
            Spacer()
                
            HStack() {
                Image("Home2").resizable().aspectRatio(contentMode: .fit)
                Image("Calendar").resizable().aspectRatio(contentMode: .fit)
                Image("Analytics").resizable().aspectRatio(contentMode: .fit)
                Image("Reading").resizable().aspectRatio(contentMode: .fit)
                Image("Settings").resizable().aspectRatio(contentMode: .fit)
            }
                
        }
        .padding(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
