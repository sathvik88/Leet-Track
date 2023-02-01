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
                gif: "promptgif",
                showDissButton: true,
                showOnboarding: $showOnboarding
            )
            
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear() {
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.secondaryLabel
        }
    }
}

