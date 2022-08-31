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
    @State var showSafari = false
    var body: some View {
        List{
            ForEach(data.filteredItems) { list in
                HStack{
                    Button {
                        self.showSafari = true
                    } label: {
                        Text(list.question)
                            .fontWeight(.medium)
                    }
                    .sheet(isPresented: $showSafari){
                        SafariView(url:URL(string: list.solution)!)
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
