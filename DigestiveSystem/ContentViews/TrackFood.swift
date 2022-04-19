//
//  TrackFood.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/20/22.
//

import SwiftUI

struct TrackFood: View {
    
    @EnvironmentObject private var dayList: DayList
    let dayIndex: Int
    let index: Int
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    let percentPicker = ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"]
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isEditing = false
    
    init(dayIndex: Int, index: Int) {
        
        self.dayIndex = dayIndex
        self.index = index
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack {
            
            Text("Track Food")
                .font(.title)
            
            HStack {
                DatePicker(selection: $dayList.list[dayIndex].foodEntries[index].date, label: {  })
                    .labelsHidden()
                
                Picker("", selection: ($dayList.list[dayIndex].foodEntries[index].duration)) {
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
            
            Slider(value: $dayList.list[dayIndex].foodEntries[index].size, in: 0...2, step: 0.25,
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
                    
                    PieSlicePickerView(pieSliceData: PieSlicePickerData(
                        startAngle: Angle(degrees: 0.0),
                        endAngle: Angle(degrees: 90.0),
                        selectedPercent: $dayList.list[dayIndex].foodEntries[index].grains,
                        text: "Grains",
                        percentPicker: percentPicker))
                    
                    PieSlicePickerView(pieSliceData: PieSlicePickerData(
                        startAngle: Angle(degrees: 90.0),
                        endAngle: Angle(degrees: 180.0),
                        selectedPercent: $dayList.list[dayIndex].foodEntries[index].protein,
                        text: "Protein",
                        percentPicker: percentPicker))
                    
                    PieSlicePickerView(pieSliceData: PieSlicePickerData(
                        startAngle: Angle(degrees: 180.0),
                        endAngle: Angle(degrees: 270.0),
                        selectedPercent: $dayList.list[dayIndex].foodEntries[index].vegetables,
                        text: "Vegetables",
                        percentPicker: percentPicker))
                    
                    PieSlicePickerView(pieSliceData: PieSlicePickerData(
                        startAngle: Angle(degrees: 270.0),
                        endAngle: Angle(degrees: 360.0),
                        selectedPercent: $dayList.list[dayIndex].foodEntries[index].fruits,
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
                            Picker("", selection: $dayList.list[dayIndex].foodEntries[index].dairy) {
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
                    
                    if dayList.list[dayIndex].foodEntries[index].foodSum() != 100 {
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
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].probiotics)
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].collagens)
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].garliconion)
                }
                
                VStack {
                    Text("probiotics")
                    Text("collagens")
                    Text("garlic/onion")
                }
                
                Spacer()
                
                VStack {
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].processed)
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].spicy)
                    CheckBoxView(checked: $dayList.list[dayIndex].foodEntries[index].highsugar)
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
              
            TextEditor(text: $dayList.list[dayIndex].foodEntries[index].notes)
                .padding(.all)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 75)
                .foregroundColor(Color.black)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .font(.body)
            
        }
        .environmentObject(dayList)
        .navigationBarTitle("Track Food", displayMode: .inline)
        .padding(.all)
    }
}
