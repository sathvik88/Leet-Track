//
//  LeetCodeContent.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import Foundation

struct LeetCodeContent: Codable, Identifiable{
    
    let id = UUID()
    let question: String
    let categorie: String
    let difficulty: String
    let solution: String
    var favorite: Bool = false

  private enum CodingKeys: String, CodingKey {
    case question = "Question"
    case categorie = "Categorie"
    case difficulty = "Difficulty"
    case solution = "Solution"
  }
    
}
