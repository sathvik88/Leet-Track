//
//  DataController.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 6/4/25.
//

import Foundation
import CoreData
class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "DataModels")
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

