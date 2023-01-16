//
//  FavoritesView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 8/31/22.
//

import SwiftUI
import SafariServices

struct FavoritesView: View {
    @ObservedObject var data = DataModel()
    @Environment(\.openURL) var openURL
    @State var selected: LeetCodeContent?
    var body: some View {
        List{
            ForEach(data.filteredItems) { list in
                Button(action:{
                    
                }){
                    
                    HStack{
                        
                        Text(list.question)
                            .fontWeight(.medium)
                            
                            
                        Spacer()
                        VStack(alignment: .center){
                            
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
                                
                            
                        }
                        Spacer()
                        Image(systemName: data.contains(list) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .onTapGesture{
                                data.toggleFavs(question: list)
                            }
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    openURL(URL(string: list.solution)!)
                }
                .onLongPressGesture(minimumDuration: 0.1) {
                    selected = list
                }
                .sheet(item: $selected, content: { item in
                    PromptView(prompt: item.prompt, solution: item.solution, question: item.question)
                })
            }
            

        }
        
        .navigationBarTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
