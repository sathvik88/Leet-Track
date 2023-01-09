//
//  TabView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI
import CoreData
struct TabViewScreen: View {
    
    @State var notification: Bool = false
    @EnvironmentObject var lnManager: NotificationManager
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            LoginView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("My Stats")
                }
            DSAlgoView()
                .tabItem{
                    Image(systemName: "book")
                    Text("Learn")
                }
        }
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase){newValue in
            if newValue == .active{
                Task{
                    await lnManager.getCurrentSettings()
                    await lnManager.getPendingRequests() 
                }
                lnManager.removeDeliveredNotifications()
            }
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewScreen()
            .environmentObject(NotificationManager())
    }
}
