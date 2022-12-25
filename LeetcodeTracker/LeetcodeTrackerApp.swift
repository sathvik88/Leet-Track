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
//        registerForNotification()
//        scheduelNotification()
    }
    
    func registerForNotification(){
        //For device token and push notification
        UIApplication.shared.registerForRemoteNotifications()
        
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: {(granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                
            }
        })
    }
    
    func scheduelNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Time to code!"
        content.subtitle = "Time to go through the list and knock out some quesitons!"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 15
        dateComponents.minute = 24
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userAuth)
        }
        
    }
}
