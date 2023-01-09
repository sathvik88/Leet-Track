//
//  NotificationsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/2/23.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var lnManager: NotificationManager
    @Environment(\.scenePhase) var scenePhase
    @State private var scheduleDate = Date()
    @State var showAlert: Bool = false
    var body: some View {
        VStack{
            if lnManager.isGranted{
                GroupBox{
                    GroupBox{
                        DatePicker("",selection: $scheduleDate)
                        Button("Schedule Notification"){
                            Task {
                                let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: scheduleDate)
                                let localNotification = LocalNotification(identifier: UUID().uuidString, title: "Time to code!", body: "Time to go through the list and knock out some quesitons!", dateComponents: dateComponents, repeats: true)
                                await lnManager.schedule(localNotification: localNotification)
                            }
                        }
                        .buttonStyle(.bordered)
                        Button("Clear Notification"){
                            lnManager.removeRequest()
                            showAlert.toggle()
                        }
                        .alert(isPresented: $showAlert, content: {
                            Alert(title: Text("All notifications cancled."))
                        })
                        .buttonStyle(.bordered)
                    }
                    
                }
                .frame(width:300)
            } else{
                Button("Enable Notifications"){
                    lnManager.openSettings()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        Spacer()
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .environmentObject(NotificationManager())
    }
}
