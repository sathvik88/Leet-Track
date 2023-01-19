//
//  OnboardingView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/19/23.
//

import SwiftUI
import SSSwiftUIGIFView
struct OnboardingView: View {
    let title: String
    let gif: String
    let showDissButton: Bool
    @Binding var showOnboarding: Bool
    var body: some View {
        VStack{
            
            Text(title)
                .font(.largeTitle)
            
            SwiftUIGIFPlayerView(gifName: gif)
                .scaledToFit()
                .cornerRadius(10)
            
            if showDissButton{
                Button(action:{
                    showOnboarding.toggle()
                }, label: {
                    Text("Finish")
                        .bold()
                        .frame(width: 100, height: 30)
                })
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
        }
        
        
    }
}


