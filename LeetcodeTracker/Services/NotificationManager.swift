//
//  NotificationManager.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/23/22.
//

import Foundation
import UserNotifications
class NotificationManager{
    
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){
             (success, error) in
            if let error = error {
                print("Error: \(error)")
            }else{
                print("Success")
            }
        }
    }
    
    func scheduelNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Time to code!"
        content.subtitle = "Time to go through the list and knock out some quesitons!"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 13
        dateComponents.minute = 12
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
