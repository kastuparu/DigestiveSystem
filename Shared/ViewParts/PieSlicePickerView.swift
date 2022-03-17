//
//  PieSlicePickerView.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/17/22.
//
//  Tutorial from: https://betterprogramming.pub/build-pie-charts-in-swiftui-822651fbf3f2

import SwiftUI

struct PieSlicePickerView: View {
    
    var pieSliceData: PieSlicePickerData
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let center = CGPoint(x: width * 0.5, y: height * 0.5)
                
                Path { path in
                    
                    path.move(to: center)
                    
                    path.addArc(
                        center: center,
                        radius: width * 0.5,
                        startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle,
                        endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle,
                        clockwise: false)
                    
                    path.addLine(to: center)
                    
                }
                .stroke(Color.accentColor, lineWidth: 10)
                
                Path { path in
                    
                    path.move(to: center)
                    
                    path.addArc(
                        center: center,
                        radius: width * 0.5,
                        startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle,
                        endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle,
                        clockwise: false)
                    
                    path.addLine(to: center)
                    
                }
                .fill(Color.white)
                
                
                VStack {
                    
                    Picker("", selection: pieSliceData.$selectedPercent) {
                        ForEach(pieSliceData.percentPicker, id: \.self) { Text($0) }
                    }
                    .accentColor(Color.black)
                    .padding(3)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2))
                    
                    Text(pieSliceData.text)
                    
                }
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.6 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.6 * sin(self.midRadians))
                    )
                    .foregroundColor(Color.black)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }}

struct PieSlicePickerData {
    var startAngle: Angle
    var endAngle: Angle
    @Binding var selectedPercent: String
    var text: String
    var percentPicker: [String]
}

struct PieSlicePickerView_Previews: PreviewProvider {
    static var previews: some View {
        PieSlicePickerView(pieSliceData: PieSlicePickerData(
                        startAngle: Angle(degrees: 0.0),
                        endAngle: Angle(degrees: 100.0),
                        selectedPercent: .constant("10%"),
                        text: "Grains",
                        percentPicker: ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"]))
    }
}
