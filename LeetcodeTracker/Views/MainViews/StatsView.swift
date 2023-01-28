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
    @State var lineWidth: CGFloat
    @State var fontSize: CGFloat
    
    
    
    var body: some View {
        if data.isAPIDown{
            Text("API is currently down, please check back later!")
            
        }else{
            NavigationView{
                VStack{
                    ZStack{
                        Circle()
                            .stroke(lineWidth: lineWidth)
                            .opacity(0.2)
                            .overlay(
                                VStack{
                                    Text("\(data.stats?.totalSolved ?? 0)")
                                        .font(.system(size: fontSize) .bold())
                                    Text("Total")
                                        .font(.system(size: fontSize) .bold())
                                })
                            .foregroundColor(Color.gray)
                        
                        Circle()
                            .trim(from: 0.0, to: CGFloat(Float(data.stats?.totalSolved ?? 0)/Float(data.stats?.totalQuestions ?? 1)))
                        
                            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.yellow)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: (Float(data.stats?.totalSolved ?? 0)/Float(data.stats?.totalQuestions ?? 1)))
                        
                    }
                    .padding()
                    HStack{
                        ZStack{
                            Circle()
                                .stroke(lineWidth: lineWidth)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.easySolved ?? 0)")
                                            .font(.system(size: fontSize) .bold())
                                        Text("Easy")
                                            .font(.system(size: fontSize) .bold())
                                    })
                                .foregroundColor(Color.gray)
                             
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.easySolved ?? 0)/Float(data.stats?.totalEasy ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.green)
                                //.frame(width: 100, height: 100)
                                //.offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.easySolved ?? 0)/Float(data.stats?.totalEasy ?? 1)))
                        }
                        .padding()
                        
                        //Medium Circle
                        ZStack{
                            Circle()
                                .stroke(lineWidth: lineWidth)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.mediumSolved ?? 0)")
                                            .font(.system(size: fontSize) .bold())
                                        Text("Medium")
                                            .font(.system(size: fontSize) .bold())
                                    })
                                .foregroundColor(Color.gray)
                                
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.mediumSolved ?? 0)/Float(data.stats?.totalMedium ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.orange)
                                //.frame(width: 100, height: 100)
                                //.offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.mediumSolved ?? 0)/Float(data.stats?.totalMedium ?? 1)))
                        }
                        .padding()
                        //Hard circle
                        ZStack{
                            Circle()
                                .stroke(lineWidth: lineWidth)
                                .opacity(0.2)
                                .overlay(
                                    VStack{
                                        Text("\(data.stats?.hardSolved ?? 0)")
                                            .font(.system(size: fontSize) .bold())
                                        Text("Hard")
                                            .font(.system(size: fontSize) .bold())
                                    })
                                .foregroundColor(Color.gray)
                                
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Float(data.stats?.hardSolved ?? 0)/Float(data.stats?.totalHard ?? 1)))
                                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.red)
                                //.frame(width: 100, height: 100)
                                //.offset(x: 50, y: 0)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: (Float(data.stats?.hardSolved ?? 0)/Float(data.stats?.totalHard ?? 1)))
                        }
                        .padding()
                        
                    }
                    ProgressView("Acceptance Rate: \(Int(data.stats?.acceptanceRate ?? 0)) %", value: data.stats?.acceptanceRate ?? 0.0, total: 100)
                        .padding([.leading,.trailing], 10)
                    
                    Text("Submission Activity")
                        .frame(alignment: .leading)
                    
                    VStack{
                        
                        if #available(iOS 16.0, *) {
                            if data.subs.count < 50{
                                Chart(data.subs){ item in
                                    BarMark(x: .value("Month", item.subDay, unit: .weekOfMonth), y: .value("Subs", item.sub))
                                    
                                }
                                
                                
                            }else{
                                Chart(data.subs){ item in
                                    BarMark(x: .value("Month", item.subDay, unit: .month), y: .value("Subs", item.sub))
                                    
                                }
                                
                            }
                            
                            
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
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        self.lineWidth = 10
                        self.fontSize = 20
                    }else{
                        self.lineWidth = 5
                        self.fontSize = 15
                    }
                    
                    
                }
                .onDisappear {
                    AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
                }
                
                .navigationBarTitle(username+"'s Stats")
                .navigationBarTitleDisplayMode(.inline)
                
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
                            Image(systemName: "arrow.triangle.2.circlepath")
                        })
                    }
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    
}
struct StatsView_Previews: PreviewProvider {
    @StateObject var data = DataModel()
    static var previews: some View {
        StatsView(lineWidth: 5, fontSize: 15)
            .environmentObject(NotificationManager())
    }
}




