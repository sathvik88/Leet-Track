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
    @Published var showingFaves = true
    @Published var savedItems: Set<String>
    var filteredItems: [LeetCodeContent] {
        if showingFaves{
            return jsonData.filter {
                savedItems.contains($0.question)
            }
        } else{
            return jsonData
        }
    }

    private var db = Database()
    
    
    init(){
        self.savedItems = db.load()
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
    
    func sortFaves() {
        withAnimation{
            showingFaves.toggle()
        }
    }
    
    func contains(_ question: LeetCodeContent)->Bool{
        savedItems.contains(question.question)
    }
    
    func toggleFavs(question: LeetCodeContent){
        if contains(question){
            savedItems.remove(question.question)
        } else {
            savedItems.insert(question.question)
        }
        db.save(questions: savedItems)
    }
    
    
    
        
}
