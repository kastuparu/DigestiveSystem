//
//  TrackFood.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/20/22.
//

import SwiftUI

struct TrackFood: View {
    
    @StateObject private var foodEntry: FoodEntry
    @ObservedObject private var day: Day
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    let percentPicker = ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"]
    
    @State private var isEditing = false
    
    init(foodEntry: FoodEntry, day: Day) {
        
        _foodEntry = StateObject(wrappedValue: foodEntry)
        self.day = day
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    init(day: Day) {
        
        _foodEntry = StateObject(wrappedValue: FoodEntry())
        self.day = day
        
        day.foodEntries.append(foodEntry)
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                HStack {
                    DatePicker(selection: $foodEntry.date, label: {  })
                        .labelsHidden()
                    
                    Picker("", selection: ($foodEntry.duration)) {
                        ForEach(durations, id: \.self) { Text(String($0)) }
                    }
                    .accentColor(Color.black)
                    .padding(3)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2))
                    
                    Text("min")
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                
                Text("How big was the meal?")
                    .font(.headline)
                    .padding(.top)
                
                Slider(value: $foodEntry.size, in: 0...2, step: 0.25,
                       onEditingChanged: {editing in isEditing = editing})
                
                HStack {
                    Text("0.0x")
                    Spacer()
                    Text("0.5x")
                    Spacer()
                    Text("1.0x")
                    Spacer()
                    Text("1.5x")
                    Spacer()
                    Text("2.0x")
                }
                
                HStack {
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color.accentColor, lineWidth: 5)
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 0.0),
                            endAngle: Angle(degrees: 90.0),
                            selectedPercent: $foodEntry.grains,
                            text: "Grains",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 90.0),
                            endAngle: Angle(degrees: 180.0),
                            selectedPercent: $foodEntry.protein,
                            text: "Protein",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 180.0),
                            endAngle: Angle(degrees: 270.0),
                            selectedPercent: $foodEntry.vegetables,
                            text: "Vegetables",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 270.0),
                            endAngle: Angle(degrees: 360.0),
                            selectedPercent: $foodEntry.fruits,
                            text: "Fruits",
                            percentPicker: percentPicker))
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        ZStack {
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 5)
                                .frame(width: 75, height: 75)
                            
                            VStack {
                                Picker("", selection: $foodEntry.dairy) {
                                    ForEach(percentPicker, id: \.self) { Text($0) }
                                }
                                .accentColor(Color.black)
                                .padding(3)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 2))
                                
                                Text("Dairy")
                            }
                            .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                        if foodEntry.foodSum() != 100 {
                            Text("doesn't add to 100%")
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "square.and.arrow.up").resizable().aspectRatio(contentMode: .fit).frame(height: 50).foregroundColor(Color.gray)
                                Text("Upload Image").foregroundColor(Color.black)
                            }
                        }
                    }
                    .frame(width: 100)
                }
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        CheckBoxView(checked: $foodEntry.probiotics)
                        CheckBoxView(checked: $foodEntry.collagens)
                        CheckBoxView(checked: $foodEntry.garliconion)
                    }
                    
                    VStack {
                        Text("probiotics")
                        Text("collagens")
                        Text("garlic/onion")
                    }
                    
                    Spacer()
                    
                    VStack {
                        CheckBoxView(checked: $foodEntry.processed)
                        CheckBoxView(checked: $foodEntry.spicy)
                        CheckBoxView(checked: $foodEntry.highsugar)
                    }
                    
                    VStack {
                        Text("processed")
                        Text("spicy")
                        Text("high sugar")
                    }
                    
                    Spacer()
                }
                .padding(.all)
                
                Text("Notes")
                    .font(.headline)
                  
                TextEditor(text: $foodEntry.notes)
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 75)
                    .foregroundColor(Color.black)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    .cornerRadius(12)
                    .font(.body)
                
            }
            .padding(.all)
        }
    }
}

struct TrackFood_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        TrackFood(day: day)
    }
}
