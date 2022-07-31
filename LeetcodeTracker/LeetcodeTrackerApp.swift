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

    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
