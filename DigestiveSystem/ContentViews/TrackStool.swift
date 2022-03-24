//
//  TrackStool.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import Introspect
import SwiftUI

struct TrackStool: View {
    
    @EnvironmentObject private var day: Day
    let index: Int
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    
    @State private var brownButtonColor = Color.black
    @State private var orangeButtonColor = Color.black
    @State private var yellowButtonColor = Color.black
    @State private var greenButtonColor = Color.black
    @State private var boogerButtonColor = Color.black
    
    @State private var smoothButtonColor = Color.white
    @State private var softButtonColor = Color.white
    @State private var wateryButtonColor = Color.white
    @State private var stickyButtonColor = Color.white
    @State private var fluffyButtonColor = Color.white
    @State private var lumpyButtonColor = Color.white
    @State private var mushyButtonColor = Color.white
    
    @State private var isEditing1 = false
    @State private var isEditing2 = false
    @State private var uiTabarController: UITabBarController?
    
    init(index: Int) {
        
        self.index = index
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    DatePicker(selection: $day.stoolEntries[index].date, label: {  })
                        .labelsHidden()
                        
                    Picker("", selection: ($day.stoolEntries[index].duration)) {
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
                .foregroundColor(Color.black)
                .background(Color.accentColor)
                .cornerRadius(12)
                .font(.title2)
                
                VStack {
                    Text("How big was it?")
                        .font(.headline)
                        .padding(.top)
                    
                    Slider(value: $day.stoolEntries[index].size, in: 0...2, step: 0.25,
                           onEditingChanged: {editing in isEditing1 = editing})
                    
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
                }
                
                VStack {
                    Text("How hard to pass was it?")
                        .font(.headline)
                        .padding(.top)
                    
                    Slider(value: $day.stoolEntries[index].difficulty, in: 0...2, step: 0.25,
                           onEditingChanged: {editing in isEditing2 = editing})
                    
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
                }
                
                HStack {
                    
                    Text("Color")
                        .font(.headline)
                    
                    Button(action: {negate(color: "r")}) {
                        Circle()
                            .stroke(brownButtonColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 148/255.0, green: 102/255.0, blue: 53/255.0)))
                    }
                    
                    Button(action: {negate(color: "o")}) {
                        Circle()
                            .stroke(orangeButtonColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 203/255.0, green: 103/255.0, blue: 14/255.0)))
                    }
                
                    Button(action: {negate(color: "y")}) {
                        Circle()
                            .stroke(yellowButtonColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 241/255.0, green: 196/255.0, blue: 15/255.0)))
                    }
                    
                    Button(action: {negate(color: "g")}) {
                        Circle()
                            .stroke(greenButtonColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 50/255.0, green: 100/255.0, blue: 40/255.0)))
                    }
                    
                    Button(action: {negate(color: "b")}) {
                        Circle()
                            .stroke(boogerButtonColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 81/255.0, green: 92/255.0, blue: 15/255.0)))
                    }
                }
                
                HStack {
                    
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {toggleTexture(texture: "m")}) {
                        Text("Smooth")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(smoothButtonColor)
                    .cornerRadius(12)
                    
                    Button(action: {toggleTexture(texture: "s")}) {
                        Text("Soft")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(softButtonColor)
                    .cornerRadius(12)
                    
                    Button(action: {toggleTexture(texture: "w")}) {
                        Text("Watery")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(wateryButtonColor)
                    .cornerRadius(12)
                }
                
                HStack {
                    
                    Button(action: {toggleTexture(texture: "t")}) {
                        Text("Sticky")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(stickyButtonColor)
                    .cornerRadius(12)
                    
                    Button(action: {toggleTexture(texture: "f")}) {
                        Text("Fluffy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(fluffyButtonColor)
                    .cornerRadius(12)
                    
                    Button(action: {toggleTexture(texture: "l")}) {
                        Text("Lumpy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(lumpyButtonColor)
                    .cornerRadius(12)
                    
                    Button(action: {toggleTexture(texture: "u")}) {
                        Text("Mushy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2))
                    }
                    .background(mushyButtonColor)
                    .cornerRadius(12)
                }
                
                Text("Notes")
                    .font(.headline)
                  
                TextEditor(text: $day.stoolEntries[index].notes)
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 75)
                    .foregroundColor(Color.black)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .font(.body)
                
            }
            .environmentObject(day)
            .navigationBarTitle("Track Stool", displayMode: .inline)
            .introspectTabBarController { (UITabBarController) in
                        UITabBarController.tabBar.isHidden = true
                        uiTabarController = UITabBarController
                    }
            .onDisappear {
                uiTabarController?.tabBar.isHidden = false
            }
            .padding(.all)
        }
    }
    
    // Sets all color selection variables to false
    func negate(color: String) {
        day.stoolEntries[index].brown = false
        brownButtonColor = Color.black
        day.stoolEntries[index].orange = false
        orangeButtonColor = Color.black
        day.stoolEntries[index].yellow = false
        yellowButtonColor = Color.black
        day.stoolEntries[index].green = false
        greenButtonColor = Color.black
        day.stoolEntries[index].booger = false
        boogerButtonColor = Color.black
        
        if color == "r" {
            day.stoolEntries[index].brown = true
            brownButtonColor = Color.accentColor
        }
        else if color == "o" {
            day.stoolEntries[index].orange = true
            orangeButtonColor = Color.accentColor
        }
        else if color == "y" {
            day.stoolEntries[index].yellow = true
            yellowButtonColor = Color.accentColor
        }
        else if color == "g" {
            day.stoolEntries[index].green = true
            greenButtonColor = Color.accentColor
        }
        else if color == "b" {
            day.stoolEntries[index].booger = true
            boogerButtonColor = Color.accentColor
        }
        
    }
    
    // Toggles a texture selection button
    func toggleTexture(texture: String) {
        if texture == "m" {
            if day.stoolEntries[index].smooth {
                smoothButtonColor = Color.white
            }
            else {
                smoothButtonColor = Color.accentColor
            }
            day.stoolEntries[index].smooth.toggle()
        }
        else if texture == "s" {
            if day.stoolEntries[index].soft {
                softButtonColor = Color.white
            }
            else {
                softButtonColor = Color.accentColor
            }
            day.stoolEntries[index].soft.toggle()
        }
        else if texture == "w" {
            if day.stoolEntries[index].watery {
                wateryButtonColor = Color.white
            }
            else {
                wateryButtonColor = Color.accentColor
            }
            day.stoolEntries[index].watery.toggle()
        }
        else if texture == "t" {
            if day.stoolEntries[index].sticky {
                stickyButtonColor = Color.white
            }
            else {
                stickyButtonColor = Color.accentColor
            }
            day.stoolEntries[index].sticky.toggle()
        }
        else if texture == "f" {
            if day.stoolEntries[index].fluffy {
                fluffyButtonColor = Color.white
            }
            else {
                fluffyButtonColor = Color.accentColor
            }
            day.stoolEntries[index].fluffy.toggle()
        }
        else if texture == "l" {
            if day.stoolEntries[index].lumpy {
                lumpyButtonColor = Color.white
            }
            else {
                lumpyButtonColor = Color.accentColor
            }
            day.stoolEntries[index].lumpy.toggle()
        }
        else if texture == "u" {
            if day.stoolEntries[index].mushy {
                mushyButtonColor = Color.white
            }
            else {
                mushyButtonColor = Color.accentColor
            }
            day.stoolEntries[index].mushy.toggle()
        }
    }
}

struct TrackStool_Previews: PreviewProvider {
    static var day = Day()
    static var previews: some View {
        TrackStool(index: 0)
            .environmentObject(day)
    }
}
