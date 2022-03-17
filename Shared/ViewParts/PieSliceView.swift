//
//  PieSliceView.swift
//  digestivesystem (iOS)
//
//  Created by Katy Stuparu on 3/15/22.
//
//  Tutorial from: https://betterprogramming.pub/build-pie-charts-in-swiftui-822651fbf3f2

import SwiftUI

struct PieSliceView: View {
    var pieSliceData: PieSliceData
    
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
                    
                    Text(pieSliceData.text1)
                    
                    Text(pieSliceData.text2)
                    
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

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var text1: String
    var text2: String
}

struct PieSliceView_Previews: PreviewProvider {
    static var previews: some View {
        PieSliceView(pieSliceData: PieSliceData(
                        startAngle: Angle(degrees: 0.0),
                        endAngle: Angle(degrees: 100.0),
                        text1: "25%",
                        text2: "Grains"))
    }
}
