//
//  Database.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 8/25/22.
//

import Foundation
final class Database{
    private let saveKey = "saveKey"
    
    func save(questions: Set<String>){
        let arr = Array(questions)
        UserDefaults.standard.set(arr, forKey: saveKey)
    }
    
    func load()->Set<String>{
        let arr = UserDefaults.standard.array(forKey: saveKey) as? [String] ?? [String]()
        return Set(arr)
    }
    
}
