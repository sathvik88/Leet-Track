//
//  OnboardingView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/18/23.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        TabView{
            WelcomeView()
            OnboardingView(
                title: "View Prompts",
                gif: "promptsPreview",
                showDissButton: false,
                showOnboarding: $showOnboarding
            )
            OnboardingView(
                title: "View Solution",
                gif: "solutionGif",
                showDissButton: true,
                showOnboarding: $showOnboarding
            )
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

