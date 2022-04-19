//
//  DailySummary.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct DailySummary: View {
    
    @EnvironmentObject private var dayList: DayList
    let dayIndex: Int
    
    let sleepOptions = ["", "0-2 hours", "3-4 hours", "5-6 hours", "7-8 hours", "9+ hours"]
    let hydrationOptions = ["", "0-2 cups", "3-4 cups", "5-6 cups", "7-8 cups", "9+ cups"]
    let exerciseStressOptions = ["", "none", "less", "average", "more", "excessive"]
    
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var selectedEntry: Entry? = nil
    @State private var uiTabarController: UITabBarController?
    
    init(dayIndex: Int) {
        
        self.dayIndex = dayIndex
        UITextView.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        let grains = dayList.list[dayIndex].grains
        let protein = dayList.list[dayIndex].protein
        let vegetables = dayList.list[dayIndex].vegetables
        let fruits = dayList.list[dayIndex].fruits
        let dairy = dayList.list[dayIndex].dairy
        let sum = grains + protein + vegetables + fruits
        
        ScrollView {
            
            VStack {
                
                Text(dayList.list[dayIndex].dateString)
                    .font(.title)
                    .padding(.all)
                
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
                    .padding(.all)
                    .frame(width: 275, height: 275)
                    
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
                        
                        Button(action: {
                            dayList.list[dayIndex].foodEntries.append(FoodEntry())
                            isActive1 = true
                        }) {
                            Image("Food").resizable().aspectRatio(contentMode: .fit)
                        }
                        .sheet(isPresented: $isActive1) {
                            TrackFood(dayIndex: dayIndex, index: dayList.list[dayIndex].foodEntries.count - 1)
                        }
                        .padding(.vertical)
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                        
                        Button(action: {
                            dayList.list[dayIndex].stoolEntries.append(StoolEntry())
                            isActive2 = true
                            
                        }) {
                            Image("Stool").resizable().aspectRatio(contentMode: .fit)
                        }
                        .sheet(isPresented: $isActive2) {
                            TrackStool(dayIndex: dayIndex, index: dayList.list[dayIndex].stoolEntries.count - 1)
                        }
                        .padding(.all)
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.black)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                        .font(.title2)
                    }
                }
                
                HStack {
                    
                    VStack {
                        Text("Sleep")
                        
                        Picker("", selection: ($dayList.list[dayIndex].sleep)) {
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
                        
                        Picker("", selection: ($dayList.list[dayIndex].hydration)) {
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
                        
                        Picker("", selection: ($dayList.list[dayIndex].exercise)) {
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
                        
                        Picker("", selection: ($dayList.list[dayIndex].stress)) {
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
                
                VStack {
                    Text("Notes (include alcohol, drugs, and caffeine)")
                    
                    TextEditor(text: $dayList.list[dayIndex].notes)
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 75)
                        .foregroundColor(Color.black)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(12)
                        .font(.body)
                }
                
                Text("Today's Entries")
                
                ForEach(dayList.list[dayIndex].entries) { entry in
                    
                    Button(action: {
                        selectedEntry = entry
                    }) {
                        EntryView(entry: entry, onDelete: {
                            
                            let i = dayList.list[dayIndex].getIndex(id: entry.id, typeFood: entry.food)
                            
                            if entry.food {
                                dayList.list[dayIndex].foodEntries.remove(at: i)
                            }
                            else {
                                dayList.list[dayIndex].stoolEntries.remove(at: i)
                            }
                            
                        })
                    }
                    .padding(.all)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    .cornerRadius(12)
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
            }
            .sheet(item: self.$selectedEntry) { entry in
                
                if entry.food {
                    let i = dayList.list[dayIndex].getIndex(id: entry.id, typeFood: true)
                    TrackFood(dayIndex: dayIndex, index: i)
                }
                
                else {
                    let i = dayList.list[dayIndex].getIndex(id: entry.id, typeFood: false)
                    TrackStool(dayIndex: dayIndex, index: i)
                }
            }
            .padding(.all)
        }
        .environmentObject(dayList)
    }
}

struct DailySummary_Previews: PreviewProvider {
    static var dayList = DayList()
    static var previews: some View {
        DailySummary(dayIndex: 0)
            .environmentObject(dayList)
    }
}
