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
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Daily Summary")
                        .font(.title)
                    
                    Text("February 26, 2022")
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
                            HStack {
                                
                                Menu("") {
                                    Text("0-2")
                                    Text("3-4")
                                    Text("5-6")
                                    Text("7-8")
                                    Text("9+")
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.black)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                                .cornerRadius(12)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                
                                Text("hrs.")
                            }
                        }
                        
                        VStack {
                            Text("Hydration")
                            HStack {
                                
                                Menu("") {
                                    Text("0-2")
                                    Text("3-4")
                                    Text("5-6")
                                    Text("7-8")
                                    Text("9+")
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.black)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                                .cornerRadius(12)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                
                                Text("cups")
                            }
                        }
                        
                        VStack {
                            Text("Exercise")
                                
                            Menu("") {
                                Text("none")
                                Text("less")
                                Text("average")
                                Text("more")
                                Text("excessive")
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                             
                        }
                        
                        VStack {
                            Text("Stress")
                                
                            Menu("") {
                                Text("none")
                                Text("less")
                                Text("average")
                                Text("more")
                                Text("excessive")
                            }
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
                    TextEditor(text: .constant("Default text"))
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
