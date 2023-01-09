//
//  LeetcodeTrackerApp.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI

@main

struct LeetcodeTrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var userAuth = UserAuth()
    @StateObject var lnManager = NotificationManager()
    let persistenceController = PersistenceController.shared
    
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        static var orientationLock = UIInterfaceOrientationMask.portrait
        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return AppDelegate.orientationLock
        }
    }
    
    
    init(){

    }

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userAuth)
                .environmentObject(lnManager) 
        }
        
    }
}
