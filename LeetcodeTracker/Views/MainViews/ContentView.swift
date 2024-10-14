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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            if data.isApiLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }else{
                List{
                    ForEach(data.searchResults) { list in
                        QuestionCardView(title: list.question, difficulty: list.difficulty, solutionLink: list.solution, item: list, isFaved: $toggleFav, description: list.prompt, showPrompt: $showSheet)
                            .environmentObject(data)
                        .alert("Uh oh,  you havent favorited any questions! 😳",isPresented: $toggleAlert) {
                            
                            Button("OK", role: .cancel) { }
                        }
                        .onTapGesture {
                            selected = list
                            showSheet.toggle()
                        }
                        
                        
                    }
                    
                }
                .navigationDestination(isPresented: $showSheet, destination: {
                    PromptView(showPrompt: $showSheet, prompt: selected?.prompt ?? "Empty", solution: selected?.solution ?? "Empty", question: selected?.question ?? "empty")
                })
                .listStyle(PlainListStyle())
                
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
                            Image(systemName: toggleFav ? "heart.fill" : "heart")
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
        .searchable(text: $data.searchText, tokens: $data.currentTokens, suggestedTokens: .constant(data.suggestedTokens),prompt: "Type to filter"){ token in
            Text(token.name)
        }
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


