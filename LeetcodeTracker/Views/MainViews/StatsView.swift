//
//  Sets.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 10/14/22.
//

import SwiftUI
let userDefaults = UserDefaults.standard

struct StatsView: View {
    @StateObject private var vm = DataModel()
    let username: String
    
    var body: some View {
        
        List{
            Text("\(vm.stats?.easySolved ?? 0)")
        }
        .task {
            await vm.loadStats(name: username)
        }
        
            
    }
}


