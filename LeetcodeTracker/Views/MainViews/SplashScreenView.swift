//
//  SplashScreenView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/23/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                    .font(.system(size:80))
                Text("Smart Coders")
                    .font(.system(size: 30))
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
