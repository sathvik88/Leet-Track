//
//  Sets.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 10/14/22.
//

import SwiftUI
import Charts

struct StatsView: View {
    @StateObject var data = DataModel()
    @AppStorage("login") private var login: Bool = false
    @AppStorage("username") private var username: String = ""
    let stats: Stats?
    
    
    var body: some View {
        if data.stats?.totalEasy == 0{
            Text("API is currently down. Please check back later!")
        }else{
            NavigationView{
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 5)
                            .opacity(0.2)
                            .overlay(
                                VStack{
                                    Text("\(data.stats?.totalSolved ?? 0)")
                                    Text("Total")
                                        .font(.system(size: 10) .bold())
                                })
                            .foregroundColor(Color.gray)
                            .frame(width: 150, height: 150)
                        
                            .offset(y: -200)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(Float(data.stats?.totalSolved ?? 0)/Float(data.stats?.totalQuestions ?? 1)))
                        
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.yellow)
                            .frame(width: 150, height: 150)
                            .offset(x: 200, y: 0)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: (Float(data.stats?.totalSolved ?? 0)/Float(data.stats?.totalQuestions ?? 1)))
                        
                    }
                    
                    HStack{
                        ZStack{
                            Circle()
                                .stroke(lineWidth: 5)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.easySolved ?? 0)")
                                        Text("Easy")
                                            .font(.system(size: 10) .bold())
                                    })
                                .foregroundColor(Color.gray)
                                .frame(width: 100, height: 100)
                            
                                .offset(y: -50)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.easySolved ?? 0)/Float(data.stats?.totalEasy ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.green)
                                .frame(width: 100, height: 100)
                                .offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.easySolved ?? 0)/Float(data.stats?.totalEasy ?? 1)))
                        }
                        
                        ZStack{
                            Circle()
                                .stroke(lineWidth: 5)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.mediumSolved ?? 0)")
                                        Text("Medium")
                                            .font(.system(size: 10) .bold())
                                    })
                            
                            
                                .foregroundColor(Color.gray)
                                .frame(width: 100, height: 100)
                                .padding()
                                .offset(y: -50)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.mediumSolved ?? 0)/Float(data.stats?.totalMedium ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.orange)
                                .frame(width: 100, height: 100)
                                .offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.mediumSolved ?? 0)/Float(data.stats?.totalMedium ?? 1)))
                        }
                        ZStack{
                            Circle()
                                .stroke(lineWidth: 5)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.hardSolved ?? 0)")
                                        Text("Hard")
                                            .font(.system(size: 10) .bold())
                                    })
                                .foregroundColor(Color.gray)
                                .frame(width: 100, height: 100)
                                .offset(y: -50)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.hardSolved ?? 0)/Float(data.stats?.totalHard ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.red)
                                .frame(width: 100, height: 100)
                                .offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.hardSolved ?? 0)/Float(data.stats?.totalHard ?? 1)))
                        }
                        
                    }
                    ProgressView("Acceptance Rate: \(Int(data.stats?.acceptanceRate ?? 0)) %", value: data.stats?.acceptanceRate ?? 0.0, total: 100)
                        .padding(.top, 50)
                    
                    Text("Submission Activity")
                        .padding(.top, 130)
                        .frame(alignment: .leading)
                    VStack{
                        
                        if #available(iOS 16.0, *) {
                            Chart(data.subs){ item in
                                BarMark(x: .value("Month", item.subDay, unit: .month), y: .value("Subs", item.sub))
                                
                            }
                            .frame(height: 200)
                            .padding(.top, 380)
                            
                        } else {
                            // Don't display chart
                        }
                    }
                    
                }
                .onAppear{
                    Task{
                        
                        if(data.subs.isEmpty){
                            await data.loadStats(name: username)
                        }
                        
                    }
                    UIApplication.shared.applicationIconBadgeNumber = 0
                    
                }
                .navigationBarTitle(username+"'s Stats")
                
                //Log user out
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            login = false
                            data.subs.removeAll()
                            
                        }, label: {
                            Text("Log out")
                        })
                    }
                    
                    //Refresh user stats
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            Task{
                                if(!data.subs.isEmpty){
                                    data.subs.removeAll()
                                }
                                await data.loadStats(name: username)
                            }
                            
                        }, label: {
                            Image(systemName: "gobackward")
                        })
                    }
                }
            }
        }
    }
    
    
}




