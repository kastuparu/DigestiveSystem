//
//  TrackFood.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/20/22.
//

import SwiftUI

struct TrackFood: View {
    
    @EnvironmentObject var day: Day
    @State var index: Int
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    
    let percentPicker = ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"]
    
    @State private var isEditing = false
    
    init(index: Int) {
        
        self.index = index
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                HStack {
                    DatePicker(selection: $day.foodEntries[index].date, label: {  })
                        .labelsHidden()
                    
                    Picker("", selection: ($day.foodEntries[index].duration)) {
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
                
                Slider(value: $day.foodEntries[index].size, in: 0...2, step: 0.25,
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
                            selectedPercent: $day.foodEntries[index].grains,
                            text: "Grains",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 90.0),
                            endAngle: Angle(degrees: 180.0),
                            selectedPercent: $day.foodEntries[index].protein,
                            text: "Protein",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 180.0),
                            endAngle: Angle(degrees: 270.0),
                            selectedPercent: $day.foodEntries[index].vegetables,
                            text: "Vegetables",
                            percentPicker: percentPicker))
                        
                        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                            startAngle: Angle(degrees: 270.0),
                            endAngle: Angle(degrees: 360.0),
                            selectedPercent: $day.foodEntries[index].fruits,
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
                                Picker("", selection: $day.foodEntries[index].dairy) {
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
                        
                        if day.foodEntries[index].foodSum() != 100 {
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
                        CheckBoxView(checked: $day.foodEntries[index].probiotics)
                        CheckBoxView(checked: $day.foodEntries[index].collagens)
                        CheckBoxView(checked: $day.foodEntries[index].garliconion)
                    }
                    
                    VStack {
                        Text("probiotics")
                        Text("collagens")
                        Text("garlic/onion")
                    }
                    
                    Spacer()
                    
                    VStack {
                        CheckBoxView(checked: $day.foodEntries[index].processed)
                        CheckBoxView(checked: $day.foodEntries[index].spicy)
                        CheckBoxView(checked: $day.foodEntries[index].highsugar)
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
                  
                TextEditor(text: $day.foodEntries[index].notes)
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
        .environmentObject(day)
        .onAppear() {
            if index == -1 {
                day.foodEntries.append(FoodEntry())
                index = day.foodEntries.count - 1
                print(index)
            }
        }
        .navigationTitle("Track Food Eaten")
    }
}

struct TrackFood_Previews: PreviewProvider {
    static let day = Day()
    static var previews: some View {
        TrackFood(index: -1)
            .environmentObject(day)
    }
}
