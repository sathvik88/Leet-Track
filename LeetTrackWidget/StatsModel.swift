//
//  File.swift
//  LeetTrackWidgetExtension
//
//  Created by Sathvik Konuganti on 2/24/24.
//
import WidgetKit
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
    let submissionCalendar: [String: Int]
    
    
    
}
struct submissions: Identifiable{
    let id = UUID()
    let subDay: Date
    let sub: Int
}
