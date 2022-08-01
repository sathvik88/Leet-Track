//
//  Board.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import Foundation

class Board: ObservableObject, Identifiable {
    private(set) var id = UUID()
    @Published var name: String
    @Published var lists: [BoardList]
    
    init(name: String, lists: [BoardList] = []){
        self.name = name
        self.lists = lists
    }
}
