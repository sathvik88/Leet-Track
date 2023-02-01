//
//  AboutView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/9/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GroupBox{
            HStack{
                Text("Version Number:")
                Text("1.0")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
