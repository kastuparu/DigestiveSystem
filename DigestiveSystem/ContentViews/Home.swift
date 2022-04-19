//
//  Home.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var dayList: DayList
    let dayIndex: Int
    
    @State private var isActive = false
    @State private var isActive1 = false
    @State private var isActive2 = false
    
    var body: some View {
        
        let grains = dayList.list[dayIndex].grains
        let protein = dayList.list[dayIndex].protein
        let vegetables = dayList.list[dayIndex].vegetables
        let fruits = dayList.list[dayIndex].fruits
        let dairy = dayList.list[dayIndex].dairy
        let sum = grains + protein + vegetables + fruits
            
        NavigationView {
            
            VStack {
                
                VStack {
                        
                    VStack {
                            
                        Text(dayList.list[dayIndex].dateString)
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
                    
                    Button(action: {
                        isActive = true
                    }) {
                        HStack {
                            
                            ZStack {
                                if grains != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: 0.0),
                                        endAngle: Angle(degrees: grains / sum * 360.0),
                                        text1: String(Int(grains)) + "%",
                                        text2: "Grains"))
                                }
                                
                                if protein != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: grains / sum * 360.0),
                                        endAngle: Angle(degrees: (protein + grains) / sum * 360.0),
                                        text1: String(Int(protein)) + "%",
                                        text2: "Protein"))
                                }
                                
                                if vegetables != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: (protein + grains) / sum * 360.0),
                                        endAngle: Angle(degrees: (vegetables + protein + grains) / sum * 360.0),
                                        text1: String(Int(vegetables)) + "%",
                                        text2: "Vegetables"))
                                }
                                
                                if fruits != 0 {
                                    PieSliceView(pieSliceData: PieSliceData(
                                        startAngle: Angle(degrees: (vegetables + protein + grains) / sum * 360.0),
                                        endAngle: Angle(degrees: 360.0),
                                        text1: String(Int(fruits)) + "%",
                                        text2: "Fruits"))
                                }
                             
                            }
                            
                            VStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .stroke(Color.accentColor, lineWidth: 5)
                                        .frame(width: 75, height: 75)
                                    
                                    VStack {
                                        Text(String(Int(dairy)) + "%")
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
                    .sheet(isPresented: $isActive) {
                        DailySummary(dayIndex: dayIndex)
                    }
                    .padding(.all)
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color.black, lineWidth: 5)
                .frame(maxHeight: .infinity))
                
                Spacer()
                
                Button(action: {
                    dayList.list[dayIndex].foodEntries.append(FoodEntry())
                    isActive1 = true
                }) {
                    Spacer()
                    Text("Track Food Eaten")
                    Spacer()
                    Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                }
                .sheet(isPresented: $isActive1) {
                    TrackFood(dayIndex: dayIndex, index: dayList.list[dayIndex].foodEntries.count - 1)
                }
                .padding(.all)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Button(action: {
                    dayList.list[dayIndex].stoolEntries.append(StoolEntry())
                    isActive2 = true
                    
                }) {
                    Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 75)
                    Spacer()
                    Text("Track Stool")
                    Spacer()
                }
                .sheet(isPresented: $isActive2) {
                    TrackStool(dayIndex: dayIndex, index: dayList.list[dayIndex].stoolEntries.count - 1)
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
        .environmentObject(dayList)
        .navigationViewStyle(.stack)
    }
}

struct Home_Previews: PreviewProvider {
    static var dayList = DayList()
    static var previews: some View {
        Home(dayIndex: 0)
            .environmentObject(dayList)
    }
}
