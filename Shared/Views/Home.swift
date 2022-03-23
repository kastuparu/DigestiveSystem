//
//  Home.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var day: Day
    
    var body: some View {
            
        NavigationView {
            
            VStack {
                
                Text("App Name")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                        
                    VStack {
                            
                        Text(day.dateString)
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
                    
                    Button(action: {}) {
                        
                        HStack {
                                
                            ZStack {
                                
                                Circle()
                                    .stroke(Color.accentColor, lineWidth: 5)
                                
                                let sum = day.grains + day.protein + day.vegetables + day.fruits
                                
                                Text(String(day.grains / sum))
                                
                                if day.grains != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: 0.0),
                                        endAngle: Angle(degrees: day.grains / sum * 360.0),
                                        text1: String(Int(day.grains)) + "%",
                                        text2: "Grains"))
                                }
                                    
                                if day.protein != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: day.grains / sum * 360.0),
                                        endAngle: Angle(degrees: (day.protein + day.grains) / sum * 360.0),
                                        text1: String(Int(day.protein)) + "%",
                                        text2: "Protein"))
                                }
                                 
                                if day.vegetables != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: (day.protein + day.grains) / sum * 360.0),
                                        endAngle: Angle(degrees: (day.vegetables + day.protein + day.grains) / sum * 360.0),
                                        text1: String(Int(day.vegetables)) + "%",
                                        text2: "Vegetables"))
                                }
                                 
                                if day.fruits != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: (day.vegetables + day.protein + day.grains) / sum * 360.0),
                                        endAngle: Angle(degrees: 360.0),
                                        text1: String(Int(day.fruits)) + "%",
                                        text2: "Fruits"))
                                }
                            }
                            
                            VStack {
                                
                                ZStack {
                                    Circle()
                                        .stroke(Color.accentColor, lineWidth: 5)
                                        .frame(width: 75, height: 75)
                                    
                                    VStack {
                                        Text(String(day.dairy) + "%")
                                        Text("Dairy")
                                    }
                                    .foregroundColor(Color.black)
                                }
                                
                                Spacer()
                                    
                                Text("Track today's heath habits")
                                    .foregroundColor(Color.red)
                                    
                                Text(">>>")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.black)

                            }
                        }
                    }
                    .padding(.all)
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color.black, lineWidth: 5)
                .frame(maxHeight: .infinity))
                    
                Spacer()
                    
                
                NavigationLink(destination: TrackFood(day: day, index: 0)) {
                    HStack {
                        Text("Track Food Eaten")
                        Spacer()
                        Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    }
                }
                .padding(.all)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    
                Spacer()
                
                HStack {
                //NavigationLink(destination: TrackStool()) {
                    HStack {
                        Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                        Spacer()
                        Text("Track Gut Conditions")
                    }
                }
                .padding(.all)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    
            }
            .padding(.all)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        Home(day: day)
    }
}
