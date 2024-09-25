//
//  LeetTrackWidget.swift
//  LeetTrackWidget
//
//  Created by Sathvik Konuganti on 2/24/24.
//

import WidgetKit
import SwiftUI
struct StatsEntry: TimelineEntry{
    var date: Date
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
struct Provider: TimelineProvider{
    func placeholder(in context: Context) -> StatsEntry {
        StatsEntry(date: Date(), status: "", message: "", totalSolved: 200, totalQuestions: 1000, easySolved: 50, totalEasy: 300, mediumSolved: 50, totalMedium: 300, hardSolved: 100, totalHard: 400, acceptanceRate: 50.0, ranking: 1, contributionPoints: 0, reputation: 0, submissionCalendar: ["": 0])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StatsEntry) -> Void) {
        let entry = StatsEntry(date: Date(), status: "", message: "", totalSolved: 200, totalQuestions: 1000, easySolved: 50, totalEasy: 300, mediumSolved: 50, totalMedium: 300, hardSolved: 100, totalHard: 400, acceptanceRate: 50.0, ranking: 1, contributionPoints: 0, reputation: 0, submissionCalendar: ["": 0])
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StatsEntry>) -> Void) {
        
        let entry = StatsEntry(date: Date(), status: "", message: "", totalSolved: 200, totalQuestions: 1000, easySolved: 50, totalEasy: 300, mediumSolved: 50, totalMedium: 300, hardSolved: 100, totalHard: 400, acceptanceRate: 50.0, ranking: 1, contributionPoints: 0, reputation: 0, submissionCalendar: ["": 0])
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
    
}

struct PlaceholderView: View{
    var body: some View{
        VStack{
            Text("0000")
        }
    }
}
struct WidgetEntryView: View{
    let entry: Provider.Entry
    var body: some View{
        VStack{
            Text("000")
                .foregroundStyle(Color.red)
        }
    }
}
@main
struct LeetTrackWidget: Widget{
    private let kind = "Leet_Track_Widget"
    var body: some WidgetConfiguration{
        
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
    }
}
