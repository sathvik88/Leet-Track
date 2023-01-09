//
//  SettingsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/2/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            link(icon: "bell", label: "Notifications", destination: NotificationsView())
        }.navigationBarTitle(Text("Settings"), displayMode: .large)
    }
}

private func link<Destination: View>(icon: String, label: String, destination: Destination) -> some View{
    return NavigationLink(destination: destination){
        HStack{
            Image(systemName: icon)
            Text(label)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
