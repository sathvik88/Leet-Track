//
//  ContentView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI
import CoreData


@available(iOS 16.0, *)
struct ContentView: View {
    
    @ObservedObject var data = DataModel()
    @State private var searchText = ""
    @Environment(\.openURL) var openURL
    @State var showSheet: Bool = false
    @State var selected: LeetCodeContent?
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    @State var toggleFav: Bool = false
    @State var toggleAlert: Bool = false
    
    
    
    
    var body: some View {
        NavigationView {
            if data.isApiLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }else{
                List{
                    ForEach(data.filteredItems.filter({ "\($0)".lowercased().contains(searchText.lowercased()) || searchText.isEmpty})) { list in
                        HStack{
                            Text(list.question)
                                .bold()
                                .foregroundColor(.accentColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            //                        Spacer()
                            
                            if(list.difficulty == "Easy"){
                                HStack{
                                    Text(list.difficulty)
                                        .foregroundColor(.green)
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Image(systemName: data.contains(list) ? "star.fill" : "star")
                                        .bold()
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
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Image(systemName: data.contains(list) ? "star.fill" : "star")
                                        .bold()
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
                                        .bold()
                                        .frame(alignment: .trailing)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Image(systemName: data.contains(list) ? "star.fill" : "star")
                                        .bold()
                                        .foregroundColor(.yellow)
                                        .onTapGesture{
                                            
                                            print(data.toggleFavs(question: list))
                                            data.toggleFavs(question: list)
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                }
                                
                                
                            }
                            
                        }
                        .contentShape(Rectangle())
                        .alert("Uh oh, you havent favorited any questions! 😳",isPresented: $toggleAlert) {
                            
                            Button("OK", role: .cancel) { }
                        }
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
                        Button(action: {
                            if data.savedItems.isEmpty{
                                toggleAlert.toggle()
                            }else{
                                data.sortFaves()
                                toggleFav.toggle()
                            }
                        },
                        label: {
                            Image(systemName: toggleFav ? "star.fill" : "star")
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
            
                
            
        }
        .searchable(text: $searchText, prompt: "Search Questions, Dificulty, Topic...")
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingTabView(showOnboarding: $showOnboarding)
        })
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
        
    }
}


