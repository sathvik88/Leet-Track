//
//  LeetcodeTrackerApp.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI

@main
struct LeetcodeTrackerApp: App {
    let persistenceController = PersistenceController.shared
    let center = UNUserNotificationCenter.current()
    
    init(){
        registerForNotification()
        scheduelNotification()
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
        dateComponents.hour = 19
        dateComponents.minute = 37
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    

    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }
}
