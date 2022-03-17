//
//  TrackFood.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/20/22.
//

import SwiftUI

struct TrackFood: View {
    
    @State private var foodEntry = FoodEntry()
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    
    let percentPicker = ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"]
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        VStack {
            
            Text("Track Food Eaten")
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            Text("Date, time, and duration")
                .font(.headline)
                .padding(.top)
            
            HStack {
                DatePicker(selection: $foodEntry.date, label: {  })
                    .labelsHidden()
                
                Picker("", selection: ($foodEntry.duration)) {
                    ForEach(durations, id: \.self) { Text(String($0)) }
                }
                .accentColor(Color.black)
                .padding(4)
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
            
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                // Follow this tutorial later: https://codewithchris.com/uislider-tutorial-ios-slider/
            
            HStack {
                
                ZStack {
                    
                    // NOTE TO FUTURE SELF (03/17 09:51): add pickers to pie chart, add dairy, add red message
                    
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
                            .padding(4)
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
                }
                .frame(width: 100)
            }
            
            HStack {
                
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
                
                Button(action: {}) {
                    Image("Upload").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                }
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
            
            HStack {
            
                Button(action: {}) {
                    HStack {
                        
                        Image("Cancel").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                        
                        Text("Go Back")
                            .foregroundColor(Color.black)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        
                        Text("Save")
                            .foregroundColor(Color.black)
                        
                        Image("Checkmark").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                    }
                }
            }
        }
        .padding(.all)
    }
}

struct TrackFood_Previews: PreviewProvider {
    static var previews: some View {
        TrackFood()
.previewInterfaceOrientation(.portrait)
    }
}
