//
//  EntryList.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/22/22.
//

import SwiftUI

struct EntryView: View {
    
    let entry: Entry
    var onDelete: () -> ()
    
    var body: some View {
        
        HStack {
            
            if entry.food {
                Image("Food").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            else {
                Image("Stool").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            }
            
            Text(entry.timeStamp)
                .padding(.horizontal)
            
            Spacer()
            
            Text(entry.shortNotes)
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash").resizable().aspectRatio(contentMode: .fit).frame(height: 35)
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

struct EntryView_Previews: PreviewProvider {
    static var entry = Entry()
    static var previews: some View {
        EntryView(entry: entry, onDelete: {} )
    }
}
