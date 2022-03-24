//
//  Home.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import Introspect
import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var day: Day
    
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var uiTabarController: UITabBarController?
    
    var body: some View {
            
        NavigationView {
            
            VStack {
                
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
                    .background(Color.accentColor)
                    .font(.title2)
                    
                    NavigationLink(destination: DailySummary()) {
                        
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
                                        Text(String(Int(day.dairy)) + "%")
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
                
                NavigationLink(destination: TrackFood(index: day.foodEntries.count - 1), isActive: $isActive1) {
                    
                    Button(action: {
                        day.foodEntries.append(FoodEntry())
                        isActive1 = true
                    }) {
                        Spacer()
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
                
                
                NavigationLink(destination: TrackStool(index: day.stoolEntries.count - 1), isActive: $isActive2) {
                    
                    Button(action: {
                        day.stoolEntries.append(StoolEntry())
                        isActive2 = true
                    }) {
                        HStack {
                            Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                            Spacer()
                            Text("Track Stool")
                            Spacer()
                        }
                    }
                }
                .padding(.all)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.all)
            .navigationBarTitle("Home", displayMode: .inline)
        }
        .environmentObject(day)
        .introspectTabBarController { (UITabBarController) in
                    UITabBarController.tabBar.isHidden = false
                    uiTabarController = UITabBarController
                }
        .onDisappear {
            uiTabarController?.tabBar.isHidden = true
        }
        .navigationViewStyle(.stack)
    }
}

struct Home_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        Home()
            .environmentObject(day)
    }
}
