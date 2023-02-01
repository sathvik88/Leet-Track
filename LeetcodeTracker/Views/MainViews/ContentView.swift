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
    @State var showSheet: Bool = false
    @State var selected: LeetCodeContent?
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    

    
    var body: some View {
        NavigationView {
            
            List{
                ForEach(data.filteredItems.filter({ "\($0)".lowercased().contains(searchText.lowercased()) || searchText.isEmpty})) { list in
                    HStack{
                        Text(list.question)
                            .fontWeight(.medium)
                            .foregroundColor(.accentColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        
//                        Spacer()
                        
                        if(list.difficulty == "Easy"){
                            HStack{
                                Text(list.difficulty)
                                    .foregroundColor(.green)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Image(systemName: data.contains(list) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .onTapGesture{
                                        data.toggleFavs(question: list)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                                
                            
                        }
                        else if(list.difficulty == "Medium"){
                            HStack {
                                Text(list.difficulty)
                                    .foregroundColor(.orange)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Image(systemName: data.contains(list) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .onTapGesture{
                                        data.toggleFavs(question: list)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                        }
                        else{
                            HStack{
                                Text(list.difficulty)
                                    .foregroundColor(.red)
                                    .fontWeight(.medium)
                                    .frame(alignment: .trailing)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Image(systemName: data.contains(list) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .onTapGesture{
                                        data.toggleFavs(question: list)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                            }
                            
                            
                        }

                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selected = list
                    }
                    
                    .sheet(item: $selected, content: { item in
                        PromptView(prompt: item.prompt, solution: item.solution, question: item.question)
                    })
                }
            }
            .navigationBarTitle("Questions")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {data.sortFaves()}, label: {
                        Image(systemName: "star")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {}, label: {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    })
                }

                
            }
            .refreshable {
                data.load()
            }
            
        }
        .searchable(text: $searchText)
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingTabView(showOnboarding: $showOnboarding)
        })
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


