//
//  CircleView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/25/24.
//

import SwiftUI

struct TotalCircleView: View {
    let solved: Int
    let total: Int
    let minWidth: CGFloat
    let idealWidth: CGFloat
    let maxWidth: CGFloat
    let minHeight: CGFloat
    let idealHeight: CGFloat
    let maxHeight: CGFloat
    let title: String
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .overlay(
                    VStack{
                        Text("\(solved)")
                            .font(.system(size: 25) .bold())
                        Text(title)
                            .font(.system(size: 20) .bold())
                    })
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(Float(solved)/Float(total)))
            
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.yellow)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: Float(solved)/Float(total))
            
        }
        .frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: .center)
    }
}

#Preview {
    TotalCircleView(solved: 50, total: 100, minWidth: 100, idealWidth: 150, maxWidth: 200, minHeight: 100, idealHeight: 150, maxHeight: 200, title: "Total")
}
