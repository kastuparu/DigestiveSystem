//
//  DailySummary.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct DailySummary: View {
    
    @EnvironmentObject private var day: Day
    
    let sleepOptions = ["", "0-2 hours", "3-4 hours", "5-6 hours", "7-8 hours", "9+ hours"]
    let hydrationOptions = ["", "0-2 cups", "3-4 cups", "5-6 cups", "7-8 cups", "9+ cups"]
    let exerciseStressOptions = ["", "none", "less", "average", "more", "excessive"]
    
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var uiTabarController: UITabBarController?
    
    init() {
        UITextView.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
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
                        
                        NavigationLink(destination: TrackFood(index: day.foodEntries.count - 1), isActive: $isActive1) {
                            
                            Button(action: {
                                day.foodEntries.append(FoodEntry())
                                isActive1 = true
                            }) {
                                Image("Food").resizable().aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding(.vertical)
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)

                        
                        NavigationLink(destination: TrackStool(index: day.stoolEntries.count - 1), isActive: $isActive2) {
                            
                            Button(action: {
                                day.stoolEntries.append(StoolEntry())
                                isActive2 = true
                            }) {
                                Image("Stool").resizable().aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding(.all)
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                    .padding(.all)
                }
                
                HStack {
                    
                    VStack {
                        Text("Sleep")
                        
                        Picker("", selection: ($day.sleep)) {
                            ForEach(sleepOptions, id: \.self) { Text($0) }
                        }
                        .accentColor(Color.black)
                        .padding(.vertical, 6.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                    
                    VStack {
                        Text("Hydration")
                        
                        Picker("", selection: ($day.hydration)) {
                            ForEach(hydrationOptions, id: \.self) { Text($0) }
                        }
                        .accentColor(Color.black)
                        .padding(.vertical, 6.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                    
                    VStack {
                        Text("Exercise")
                        
                        Picker("", selection: ($day.exercise)) {
                            ForEach(exerciseStressOptions, id: \.self) { Text($0) }
                        }
                        .accentColor(Color.black)
                        .padding(.vertical, 6.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                    
                    VStack {
                        Text("Stress")
                        
                        Picker("", selection: ($day.stress)) {
                            ForEach(exerciseStressOptions, id: \.self) { Text($0) }
                        }
                        .accentColor(Color.black)
                        .padding(.vertical, 6.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                }
                .padding(.all)
                
                VStack {
                    Text("Notes (include alcohol, drugs, and caffeine)")
                    
                    TextEditor(text: $day.notes)
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 75)
                        .foregroundColor(Color.black)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(12)
                        .font(.body)
                }
                .padding(.all)
                
                Text("Today's Entries")
                
                List(day.entries) { entry in
                    EntryView(entry: entry)
                }
                .listStyle(PlainListStyle())
                
            }
            .environmentObject(day)
            .navigationBarTitle(day.dateString, displayMode: .inline)
            .introspectTabBarController { (UITabBarController) in
                        UITabBarController.tabBar.isHidden = true
                        uiTabarController = UITabBarController
                    }
            .onDisappear {
                uiTabarController?.tabBar.isHidden = false
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct DailySummary_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        DailySummary()
            .environmentObject(day)
    }
}
