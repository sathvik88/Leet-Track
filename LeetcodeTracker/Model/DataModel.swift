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
    @Published var stats: Stats?
    @Published var subs = [submissions]()
    @Published var calenderData = [Date()]
    @Published var username: String = ""
    @Published var showingFaves = false
    @Published var savedItems: Set<String>
    @Published var isAPIDown = false
    @Published var isApiLoading = true
    @Published var isStatsApiLoading = true
    @Published var accentColor: Color = .blue
    @Published var searchText: String = ""
    @Published var calendarLoaded: Bool = false
    let df = DateFormatter()
    let allTokens = [Token(name: "easy"), Token(name: "medium"), Token(name: "hard")]
    @Published var currentTokens = [Token]()
    var suggestedTokens: [Token] {
            if searchText.starts(with: "$") {
                return allTokens
            } else {
                return []
            }
        }
    var filteredItems: [LeetCodeContent] {
        if showingFaves{
            return jsonData.filter{ savedItems.contains($0.question)}
            
        } else{
            return jsonData
        }
    }
    var searchResults: [LeetCodeContent]{
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)
        if showingFaves{
            return jsonData.filter{ savedItems.contains($0.question)}
        }else{
            return jsonData.filter{ jsonData in
                if searchText.isEmpty == false{
                    return "\(jsonData)".lowercased().contains(searchText.lowercased())
                    
                }
                if currentTokens.isEmpty == false{
                    for token in currentTokens {
                        if token.name.lowercased().contains(jsonData.difficulty){
                            return true
                        }
                        
                    }
                    return false
                }
                return true
                
            }
        }
        
    }
    
    private var db = Database()
    
    init(){
        self.savedItems = db.load()
        load()
        
    }
    
    func load(){
        guard let url = URL(string: "https://sathvik88.github.io/LeetcodeQuestionsAPI/leetcode.json")
        else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([LeetCodeContent].self, from: data)
                    DispatchQueue.main.async {
                        self.jsonData = json
                        if !self.jsonData.isEmpty{
                            self.isApiLoading.toggle()
                        }
                    }
                } else{
                    print("No data")
                }
            } catch{
                print(error)
            }
            
        }.resume()
        
    }

    func loadStats(name: String) async{
        
        guard let url = URL(string: "https://leetcode-stats-api.herokuapp.com/\(name)")
        else{return}
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            let res = try JSONDecoder().decode(Stats.self, from: data)
            DispatchQueue.main.async{
                self.stats = res
                print(res.message)
                if Int(res.acceptanceRate) < 35{
                    self.accentColor = .red
                }else if Int(res.acceptanceRate) > 35 && Int(res.acceptanceRate) < 70{
                    self.accentColor = .orange
                }else if Int(res.acceptanceRate ) > 70{
                    self.accentColor = .green
                }else{
                    self.accentColor = .blue
                }
                
                //Submission activity (fix with dates later)
                for (key,val) in res.submissionCalendar{
                    
                    self.subs.append(submissions(subDay: Date(timeIntervalSince1970: Double(key) ?? 0.0), sub: val))
                    self.calenderData.append(Date(timeIntervalSince1970: Double(key) ?? 0.0))

                    
                }
                if !self.calenderData.isEmpty{
                    self.calendarLoaded = true
                }
                print(self.calenderData)
            }
            
        }
        catch{
            print("Network Error")
            isAPIDown = true
        }
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
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
