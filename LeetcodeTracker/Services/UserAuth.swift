//
//  UserAuth.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/7/22.
//

import Foundation
import Combine
class UserAuth: ObservableObject{
    @Published var isLoggedIn:Bool = false
    func login() {
        self.isLoggedIn = true
    }
}
