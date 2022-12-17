//
//  ContentView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @ObservedObject var data = DataModel()
    @State private var searchText = ""
    @Environment(\.openURL) var openURL

    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List{
                    ForEach(data.jsonData.filter({ "\($0)".contains(searchText) || searchText.isEmpty})) { list in
                        HStack{
                            Button {
                                openURL(URL(string: list.solution)!)
                                UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                UNUserNotificationCenter.current().setBadgeCount(0)
                            } label: {
                                Text(list.question)
                                    .fontWeight(.medium)
                            }
                            
                            Spacer()
                            
                            if(list.difficulty == "Easy"){
                                Text(list.difficulty)
                                    .foregroundColor(.green)
                                    .fontWeight(.medium)
                                    
                            }
                            else if(list.difficulty == "Medium"){
                                Text(list.difficulty)
                                    .foregroundColor(.orange)
                                    .fontWeight(.medium)
                            }
                            else{
                                Text(list.difficulty)
                                    .foregroundColor(.red)
                                    .fontWeight(.medium)
                            }
                            Spacer()
                            Image(systemName: data.contains(list) ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture{
                                    data.toggleFavs(question: list)
                                }
                        }
                    }
                }
                .navigationBarTitle("Questions")
                .toolbar{
                    Button(action: {}, label: {
                            NavigationLink(destination: FavoritesView()) {
                                Text("Favorites")
                            }
                        })
                }
                
            }
            .searchable(text: $searchText)
        } else {
            // Fallback on earlier versions
        }
        
        }
        
    }
    

    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


