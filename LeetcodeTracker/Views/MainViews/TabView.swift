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
    @State private var selection = 1
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView(selection: $selection){
            ContentView()
                
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(1)
            LoginView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("My Stats")
                }
                .tag(2)
            DSAlgoView()
                .tabItem{
                    Image(systemName: "book")
                    Text("Learn")
                }
                .tag(3)
            LeetFormsView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Forms")
                }
                .tag(4)
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
