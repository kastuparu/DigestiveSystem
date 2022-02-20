//
//  TrackFood.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/20/22.
//

import SwiftUI

struct TrackFood: View {
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
            
            Text("How big was the meal?")
                .font(.headline)
                .padding(.top)
            
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                // Follow this tutorial later: https://codewithchris.com/uislider-tutorial-ios-slider/
            
            HStack {
                
                // Replace with food chart
                Image("Home2").resizable().aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    Text("Upload image (optional)")
                        .multilineTextAlignment(.center)
                    
                    // Add upload icon later
                }
            }
            
            
            
            
            
            
        }
        .padding(.all)
    }
}

struct TrackFood_Previews: PreviewProvider {
    static var previews: some View {
        TrackFood()
    }
}
