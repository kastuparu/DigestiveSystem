//
//  TrackStool.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct TrackStool: View {
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    // Date, time, and duration selection variables
    @State var date = Date()
    @State var duration = 0
    
    // Color selection variables
    @State var brown = false
    @State var orange = false
    @State var yellow = false
    @State var green = false
    @State var booger = false
    
    // Sets all color selection variables to false
    func negate() -> Void {
        brown = false
        orange = false
        yellow = false
        green = false
        booger = false
    }
    
    // Texture selection variables
    @State var smooth = false
    @State var soft = false
    @State var watery = false
    @State var sticky = false
    @State var fluffy = false
    @State var lumpy = false
    @State var mushy = false
    
    // Notes text variable
    @State var notes = ""
    
    var body: some View {
        
        VStack {
            
            Text("Track Stool")
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            Text("Date, time, and duration")
                .font(.headline)
                .padding(.top)
            
            HStack {
                DatePicker(selection: $date, label: {  })
                    .labelsHidden()
                    
                Picker("", selection: $duration) {
                    Text("").tag(0)
                    Text("5").tag(5)
                    Text("15").tag(15)
                    Text("30").tag(30)
                    Text("45").tag(45)
                    Text("60").tag(60)
                    Text("75").tag(75)
                }
                .accentColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2))
                
                Text("min")
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(Color.accentColor)
            .cornerRadius(12)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                Text("How big was it?")
                    .font(.headline)
                    .padding(.top)
                
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                    // Follow this tutorial later: https://codewithchris.com/uislider-tutorial-ios-slider/
                
                Text("How hard to pass was it?")
                    .font(.headline)
                    .padding(.top)
                
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                    // Follow this tutorial later: https://codewithchris.com/uislider-tutorial-ios-slider/
            }
            
            VStack {
                
                HStack {
                    
                    Text("Color")
                        .font(.headline)
                    
                    Button(action: {negate(); brown = true}) {
                        Circle()
                            .stroke(brown ? Color.accentColor : Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 148/255.0, green: 102/255.0, blue: 53/255.0)))
                    }
                    
                    Button(action: {negate(); orange = true}) {
                        Circle()
                            .stroke(orange ? Color.accentColor : Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 203/255.0, green: 103/255.0, blue: 14/255.0)))
                    }
                
                    Button(action: {negate(); yellow = true}) {
                        Circle()
                            .stroke(yellow ? Color.accentColor : Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 241/255.0, green: 196/255.0, blue: 15/255.0)))
                    }
                    
                    Button(action: {negate(); green = true}) {
                        Circle()
                            .stroke(green ? Color.accentColor : Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 50/255.0, green: 100/255.0, blue: 40/255.0)))
                    }
                    
                    Button(action: {negate(); booger = true}) {
                        Circle()
                            .stroke(booger ? Color.accentColor : Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 81/255.0, green: 92/255.0, blue: 15/255.0)))
                    }
                }
                
                HStack {
                    
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {smooth = !smooth}) {
                        Text("Smooth")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(smooth ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(smooth ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {soft = !soft}) {
                        Text("Soft")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(soft ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(soft ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {watery = !watery}) {
                        Text("Watery")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(watery ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(watery ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                }
                
                HStack {
                    
                    Button(action: {sticky = !sticky}) {
                        Text("Sticky")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(sticky ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(sticky ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {fluffy = !fluffy}) {
                        Text("Fluffy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(fluffy ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(fluffy ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {lumpy = !lumpy}) {
                        Text("Lumpy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(lumpy ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(lumpy ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {mushy = !mushy}) {
                        Text("Mushy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(mushy ? Color.accentColor : Color.black, lineWidth: 2))
                    }
                    .background(mushy ? Color.accentColor : Color.white)
                    .cornerRadius(12)
                }
                
            }
            
            Text("Notes")
                .font(.headline)
              
            TextEditor(text: $notes)
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

struct TrackStool_Previews: PreviewProvider {
    static var previews: some View {
        TrackStool()
    }
}
