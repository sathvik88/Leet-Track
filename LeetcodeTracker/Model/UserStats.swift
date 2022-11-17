//
//  UserStats.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/6/22.
//

import Foundation

struct Stats: Codable, Identifiable{
    let id = UUID()
    let status: String
    let message: String
    let totalSolved: Int
    let totalQuestions: Int
    let easySolved: Int
    let totalEasy: Int
    let mediumSolved: Int
    let totalMedium: Int
    let hardSolved: Int
    let totalHard: Int
    let acceptanceRate: Double
    let ranking: Int
    let contributionPoints: Int
    let reputation: Int
    
}
