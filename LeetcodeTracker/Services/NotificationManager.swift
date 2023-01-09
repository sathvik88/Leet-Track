//
//  NotificationManager.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/23/22.
//

import Foundation
import NotificationCenter
@MainActor
class NotificationManager: ObservableObject{
    
    static let instance = NotificationManager() //Singleton
    @Published var pendingRequests: [UNNotificationRequest] = []
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isGranted = false
    
    func requestAuthorization() async throws {
        try await notificationCenter
            .requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async{
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
        
    }
    
    func openSettings(){
        if let url = URL(string:  UIApplication.openSettingsURLString){
            if UIApplication.shared.canOpenURL(url){
                Task{
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func schedule(localNotification: LocalNotification) async {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = .default
        content.badge = 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: localNotification.dateComponents, repeats: localNotification.repeats)
        let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
        try? await notificationCenter.add(request)
        await getPendingRequests()
    }
    
    func getPendingRequests() async{
        pendingRequests = await notificationCenter.pendingNotificationRequests()
        print("Pending:\(pendingRequests.count)")
    }
    
    func removeRequest(){
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.removeAllDeliveredNotifications()
    }
    func removeDeliveredNotifications(){
        
        notificationCenter.removeAllDeliveredNotifications()
        if #available(iOS 16.0, *) {
            notificationCenter.setBadgeCount(0)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
    
    
}
