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
  
    @StateObject private var coreDataStack = DataController()
    
    
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
              
                .environmentObject(userAuth)
                .environmentObject(lnManager) 
        }
        .environment(\.managedObjectContext,
                      coreDataStack.container.viewContext)
        
    }
}
