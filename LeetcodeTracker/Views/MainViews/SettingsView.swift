//
//  SettingsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/2/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            List{
                Section{
                    NavigationLink(destination: NotificationsView(), label: {
                        Text("Notifications")
                    })
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
