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
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: {  })
                    .labelsHidden()
                    
                
                Picker(selection: .constant(0), label: Text("")) {
                    Text("").tag(0)
                    Text("5").tag(1)
                    Text("15").tag(2)
                    Text("30").tag(3)
                    Text("45").tag(4)
                    Text("60").tag(5)
                    Text("75").tag(6)
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                Text("min")
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
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
                    
                    Button(action: {}) {
                        Circle()
                            .stroke(Color.accentColor, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 148/255.0, green: 102/255.0, blue: 53/255.0)))
                    }
                    
                    Button(action: {}) {
                        Circle()
                            .stroke(Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 203/255.0, green: 103/255.0, blue: 14/255.0)))
                    }
                
                    Button(action: {}) {
                        Circle()
                            .stroke(Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 241/255.0, green: 196/255.0, blue: 15/255.0)))
                    }
                    
                    Button(action: {}) {
                        Circle()
                            .stroke(Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 50/255.0, green: 100/255.0, blue: 40/255.0)))
                    }
                    
                    Button(action: {}) {
                        Circle()
                            .stroke(Color.black, lineWidth: 4)
                            .background(Circle().foregroundColor(Color(red: 81/255.0, green: 92/255.0, blue: 15/255.0)))
                    }
                }
                
                HStack {
                    
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Smooth")
                            .foregroundColor(Color.black)
                            .padding(.all)
                    }
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Soft")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Watery")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                }
                
                HStack {
                    
                    Button(action: {}) {
                        Text("Sticky")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Fluffy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Lumpy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Mushy")
                            .foregroundColor(Color.black)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                }
                
            }
            
            Text("Notes")
                .font(.headline)
              
            TextEditor(text: .constant("Default text"))
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
