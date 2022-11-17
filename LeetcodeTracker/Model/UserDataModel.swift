//
//  UserDataModel.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/6/22.
//

import Foundation
import Combine

final class UserDataModel: ObservableObject{
    @Published var userData = [Stats]()
    
    init(){
        
        loadStats()
    }
    func loadStats(){
        guard let url = URL(string: "https://leetcode-stats-api.herokuapp.com/sathvik99")
        else{return}
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            guard let data = data else {return}
            
            do {
                let res = try JSONDecoder().decode(Stats.self, from: data)
                print(res)
            }catch{
                print("Failed to Decode: \(error)")
            }
        }.resume()
    }
}
