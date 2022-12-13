//
//  Sets.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 10/14/22.
//

import SwiftUI
import Charts
let userDefaults = UserDefaults.standard

struct StatsView: View {
    @StateObject var data = DataModel()
    @AppStorage("login") private var login: Bool = false
    @EnvironmentObject  var userAuth: UserAuth
    @AppStorage("username") private var username: String = ""
    @State private var showingSheet = false
    let stats: Stats?
    let subs: [submissions]
    @State private var easyPerc: Float = 1.0
    var responseMessages = ["200": 12]
    
    
    
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                
                
                ZStack{
                    Circle()
                        .stroke(lineWidth: 5)
                        .opacity(0.2)
                        .overlay(
                            VStack{
                                Text("\(stats?.totalSolved ?? 0)")
                                Text("Total")
                                    .font(.system(size: 10) .bold())
                            })
                        .foregroundColor(Color.gray)
                        .frame(width: 150, height: 150)
                        
                        .offset(y: -200)
                    Circle()
                        .trim(from: 0.0, to: CGFloat(Float(stats?.totalSolved ?? 0)/Float(stats?.totalQuestions ?? 1)))
                        
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.yellow)
                        .frame(width: 150, height: 150)
                        .offset(x: 200, y: 0)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut, value: (Float(stats?.totalSolved ?? 0)/Float(stats?.totalQuestions ?? 1)))
                    
                }
  
                HStack{
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 5)
                            .opacity(0.2)
                            .overlay(
                                VStack{
                                    Text("\(stats?.easySolved ?? 0)")
                                    Text("Easy")
                                        .font(.system(size: 10) .bold())
                                })
                            .foregroundColor(Color.gray)
                            .frame(width: 100, height: 100)
                            
                            .offset(y: -50)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(Float(stats?.easySolved ?? 0)/Float(stats?.totalEasy ?? 1)))
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.green)
                            .frame(width: 100, height: 100)
                            .offset(x: 50, y: 0)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: (Float(stats?.easySolved ?? 0)/Float(stats?.totalEasy ?? 1)))
                    }
                    
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 5)
                            .opacity(0.2)
                            .overlay(
                                VStack{
                                    Text("\(stats?.mediumSolved ?? 0)")
                                    Text("Medium")
                                        .font(.system(size: 10) .bold())
                                })
                                
                        
                            .foregroundColor(Color.gray)
                            .frame(width: 100, height: 100)
                            .padding()
                            .offset(y: -50)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(Float(stats?.mediumSolved ?? 0)/Float(stats?.totalMedium ?? 1)))
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.orange)
                            .frame(width: 100, height: 100)
                            .offset(x: 50, y: 0)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: (Float(stats?.mediumSolved ?? 0)/Float(stats?.totalMedium ?? 1)))
                    }
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 5)
                            .opacity(0.2)
                            .overlay(
                                VStack{
                                    Text("\(stats?.hardSolved ?? 0)")
                                    Text("Hard")
                                        .font(.system(size: 10) .bold())
                                })
                            .foregroundColor(Color.gray)
                            .frame(width: 100, height: 100)
                            .offset(y: -50)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(Float(stats?.hardSolved ?? 0)/Float(stats?.totalHard ?? 1)))
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.red)
                            .frame(width: 100, height: 100)
                            .offset(x: 50, y: 0)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: (Float(stats?.hardSolved ?? 0)/Float(stats?.totalHard ?? 1)))
                    }
                    
                }
                ProgressView("Acceptance Rate: \(Int(stats?.acceptanceRate ?? 0)) %", value: stats?.acceptanceRate ?? 0.0, total: 100)
                    .padding(.top, 50)

                Text("Submission Activity")
                    .padding(.top, 130)
                    .frame(alignment: .leading)
                VStack{
                    
                    if #available(iOS 16.0, *) {
                        Chart(subs){ item in
                            BarMark(x: .value("Month", item.subDay, unit: .month), y: .value("Subs", item.sub))
                            
                        }
                        .frame(height: 200)
                        .padding(.top, 380)
                        
                    } else {
                        // Fallback on earlier versions
                        
                    }
                }
                    
                    
                
            }
            .navigationBarTitle(username+"'s Stats")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        login = false
                    }, label: {
                        Text("Log out")
                    })
                }
            }
        }
        .onAppear(){
            
            print(stats?.submissionCalendar.values ?? 0)
            
        }
        
    
    }
    
                            
            
    }




