//
//  DailySummary.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/17/22.
//

import SwiftUI

struct DailySummary: View {
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    @State var day = Day()
    
    let sleepOptions = ["", "0-2 hours", "3-4 hours", "5-6 hours", "7-8 hours", "9+ hours"]
    let hydrationOptions = ["", "0-2 cups", "3-4 cups", "5-6 cups", "7-8 cups", "9+ cups"]
    let exerciseStressOptions = ["", "none", "less", "average", "more", "excessive"]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Daily Summary")
                        .font(.title)
                    
                    Text(day.dateString())
                        .font(.subheadline)
                    
                    HStack {
                        
                        Image("Home").resizable().aspectRatio(contentMode: .fit)
                        
                        VStack {
                            
                            Text("You are eating less ___ than normal today")
                                .foregroundColor(Color.red)
                                .frame(width: 125)
                            
                            Button(action: {}) {
                                HStack {
                                    Text("New").font(.body)
                                    Image("Food").resizable().aspectRatio(contentMode: .fit)
                                }
                            }
                            .padding(.vertical)
                            .frame(width: 125, height: 75)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            
                            Button(action: {}) {
                                HStack {
                                    Image("Stool").resizable().aspectRatio(contentMode: .fit)
                                    Text("New").font(.body)
                                }
                            }
                            .padding(.all)
                            .frame(width: 125, height: 75)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    Spacer(minLength: 25)
                    
                    HStack {
                        
                        VStack {
                            Text("Sleep")
                            
                            Picker("", selection: ($day.sleep)) {
                                ForEach(sleepOptions, id: \.self) { Text($0) }
                            }
                            .accentColor(Color.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack {
                            Text("Hydration")
                            
                            Picker("", selection: ($day.hydration)) {
                                ForEach(hydrationOptions, id: \.self) { Text($0) }
                            }
                            .accentColor(Color.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack {
                            Text("Exercise")
                                
                            Picker("", selection: ($day.exercise)) {
                                ForEach(exerciseStressOptions, id: \.self) { Text($0) }
                            }
                            .accentColor(Color.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack {
                            Text("Stress")
                                
                            Picker("", selection: ($day.stress)) {
                                ForEach(exerciseStressOptions, id: \.self) { Text($0) }
                            }
                            .accentColor(Color.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Text("Notes (include alcohol, drugs, and caffeine)")
                    TextEditor(text: $day.notes)
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 150)
                        .foregroundColor(Color.black)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(12)
                        .font(.body)
                    
                    Spacer(minLength: 25)
                    
                    // Add a RecyclerView to include each entry of the day
                    
                    VStack {
                    
                        Button(action: {}) {
                            HStack {
                                
                                Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                                
                                Spacer()
                                
                                Text("3:14 pm")
                                
                                Spacer()
                                
                                Text("notes...")
                                
                                Spacer()
                                
                                Image("Trash").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                                
                            }
                        }
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(12)
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {}) {
                            HStack {
                                
                                Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                                
                                Spacer()
                                
                                Text("3:14 pm")
                                
                                Spacer()
                                
                                Text("notes...")
                                
                                Spacer()
                                
                                Image("Trash").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                                
                            }
                        }
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(12)
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        
                    }
                }
            }
            
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

struct DailySummary_Previews: PreviewProvider {
    static var previews: some View {
        DailySummary()
    }
}
