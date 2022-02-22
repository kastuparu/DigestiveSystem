//
//  CheckBoxView.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 2/21/22.
//  https://stackoverflow.com/questions/58425829/how-can-i-create-a-text-with-checkbox-in-swiftui
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = true

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
