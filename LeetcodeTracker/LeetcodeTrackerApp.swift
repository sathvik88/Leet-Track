//
//  LeetcodeTrackerApp.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI

@main
struct LeetcodeTrackerApp: App {
    @StateObject private var userAuth = UserAuth()
    let persistenceController = PersistenceController.shared
    let center = UNUserNotificationCenter.current()
    
    init(){

    }
    
    
    
    
    

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userAuth)
        }
        
    }
}
