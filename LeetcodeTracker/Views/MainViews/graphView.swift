//
//  graphView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/10/22.
//

import SwiftUI

struct graphView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart{
                BarMark(
                    x: .value("day", Int(stats?.submissionCalendar.count ?? 0)),
                    y: .value("Sub", Int(from: stats?.submissionCalendar.values ?? 0))
                )
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct graphView_Previews: PreviewProvider {
    static var previews: some View {
        graphView()
    }
}
