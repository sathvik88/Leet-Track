//
//  LocalNotification.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/8/23.
//

import Foundation

struct LocalNotification{
    
    internal init(identifier: String, title: String, body: String, dateComponents: DateComponents, repeats: Bool) {
        self.identifier = identifier
        self.title = title
        self.body = body
        self.timeInterval = nil
        self.dateComponents = dateComponents
        self.repeats = repeats
    }
    var identifier: String
    var title: String
    var body: String
    var timeInterval: Double?
    var dateComponents: DateComponents
    var repeats: Bool
}
