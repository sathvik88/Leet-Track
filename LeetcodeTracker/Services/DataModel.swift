//
//  DataModel.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import Foundation
import SwiftUI
import Combine

final class DataModel: ObservableObject{
    @Published var jsonData = [LeetCodeContent]()
    
    init(){
        load()
    }
    
    func load(){
        let path = Bundle.main.path(forResource: "leetcode", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([LeetCodeContent].self, from: data)
                    DispatchQueue.main.async {
                        self.jsonData = json
                    }
                } else{
                    print("No data")
                }
            } catch{
                print(error)
            }
            
        }.resume()
    }
}
