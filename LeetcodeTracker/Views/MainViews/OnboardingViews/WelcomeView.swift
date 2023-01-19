//
//  WelcomeView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/19/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome!")
                .bold()
                .font(.largeTitle)
            Text("Swipe to begin.")
                .bold()
                .font(.subheadline)
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
