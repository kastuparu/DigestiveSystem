//
//  TrackStool.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/22/22.
//

import SwiftUI

struct TrackStool: View {
    
    @Binding var stoolEntry: StoolEntry
    
    let durations = [0, 5, 15, 30, 45, 60, 75]
    
    @State private var isEditing1 = false
    @State private var isEditing2 = false
    
    init(stoolEntry: Binding<StoolEntry>) {
        self._stoolEntry = stoolEntry
        UITextView.appearance().backgroundColor = .clear
    }
    
    // Sets all color selection variables to false
    func negate() -> Void {
        stoolEntry.brown = false
        stoolEntry.orange = false
        stoolEntry.yellow = false
        stoolEntry.green = false
        stoolEntry.booger = false
    }
    
    var body: some View {
        
        VStack {
            
            Text("Track Stool")
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            HStack {
                DatePicker(selection: $stoolEntry.date, label: {  })
                    .labelsHidden()
                    
                Picker("", selection: ($stoolEntry.duration)) {
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
            .background(Color.accentColor)
            .cornerRadius(12)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("How big was it?")
                    .font(.headline)
                    .padding(.top)
                
                Slider(value: $stoolEntry.size, in: 0...2, step: 0.25,
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
                
                Slider(value: $stoolEntry.difficulty, in: 0...2, step: 0.25,
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
                
                Button(action: {negate(); stoolEntry.brown = true}) {
                    Circle()
                        .stroke(stoolEntry.brown ? Color.accentColor : Color.black, lineWidth: 4)
                        .background(Circle().foregroundColor(Color(red: 148/255.0, green: 102/255.0, blue: 53/255.0)))
                }
                
                Button(action: {negate(); stoolEntry.orange = true}) {
                    Circle()
                        .stroke(stoolEntry.orange ? Color.accentColor : Color.black, lineWidth: 4)
                        .background(Circle().foregroundColor(Color(red: 203/255.0, green: 103/255.0, blue: 14/255.0)))
                }
            
                Button(action: {negate(); stoolEntry.yellow = true}) {
                    Circle()
                        .stroke(stoolEntry.yellow ? Color.accentColor : Color.black, lineWidth: 4)
                        .background(Circle().foregroundColor(Color(red: 241/255.0, green: 196/255.0, blue: 15/255.0)))
                }
                
                Button(action: {negate(); stoolEntry.green = true}) {
                    Circle()
                        .stroke(stoolEntry.green ? Color.accentColor : Color.black, lineWidth: 4)
                        .background(Circle().foregroundColor(Color(red: 50/255.0, green: 100/255.0, blue: 40/255.0)))
                }
                
                Button(action: {negate(); stoolEntry.booger = true}) {
                    Circle()
                        .stroke(stoolEntry.booger ? Color.accentColor : Color.black, lineWidth: 4)
                        .background(Circle().foregroundColor(Color(red: 81/255.0, green: 92/255.0, blue: 15/255.0)))
                }
            }
            
            HStack {
                
                Text("Texture")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {stoolEntry.smooth = !stoolEntry.smooth}) {
                    Text("Smooth")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.smooth ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.smooth ? Color.accentColor : Color.white)
                .cornerRadius(12)
                
                Button(action: {stoolEntry.soft = !stoolEntry.soft}) {
                    Text("Soft")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.soft ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.soft ? Color.accentColor : Color.white)
                .cornerRadius(12)
                
                Button(action: {stoolEntry.watery = !stoolEntry.watery}) {
                    Text("Watery")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.watery ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.watery ? Color.accentColor : Color.white)
                .cornerRadius(12)
            }
            
            HStack {
                
                Button(action: {stoolEntry.sticky = !stoolEntry.sticky}) {
                    Text("Sticky")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.sticky ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.sticky ? Color.accentColor : Color.white)
                .cornerRadius(12)
                
                Button(action: {stoolEntry.fluffy = !stoolEntry.fluffy}) {
                    Text("Fluffy")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.fluffy ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.fluffy ? Color.accentColor : Color.white)
                .cornerRadius(12)
                
                Button(action: {stoolEntry.lumpy = !stoolEntry.lumpy}) {
                    Text("Lumpy")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.lumpy ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.lumpy ? Color.accentColor : Color.white)
                .cornerRadius(12)
                
                Button(action: {stoolEntry.mushy = !stoolEntry.mushy}) {
                    Text("Mushy")
                        .foregroundColor(Color.black)
                        .padding(.all)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(stoolEntry.mushy ? Color.accentColor : Color.black, lineWidth: 2))
                }
                .background(stoolEntry.mushy ? Color.accentColor : Color.white)
                .cornerRadius(12)
            }
            
            Text("Notes")
                .font(.headline)
              
            TextEditor(text: $stoolEntry.notes)
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

struct TrackStool_Previews: PreviewProvider {
    static var previews: some View {
        TrackStool(stoolEntry: .constant(StoolEntry()))
    }
}
