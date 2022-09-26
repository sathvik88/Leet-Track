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
    var body: some View {
        List{
            ForEach(data.filteredItems) { list in
                HStack{
                    Button {
                        openURL(URL(string: list.solution)!)
                    } label: {
                        Text(list.question)
                            .fontWeight(.medium)
                    }
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
        }
        .navigationBarTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
