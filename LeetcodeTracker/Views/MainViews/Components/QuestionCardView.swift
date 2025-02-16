//
//  QuestionCardView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 10/5/24.
//

import SwiftUI

struct QuestionCardView: View {
    @ObservedObject var data = DataModel()
    let title: String
    let difficulty: String
    let solutionLink: String
    let item: LeetCodeContent
    @Binding var isFaved: Bool
    let description: String
    @Binding var showPrompt: Bool
    @State var toggleFav: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .frame(height: 100)
                .foregroundStyle(colorScheme == .dark ? Color(hex: "#1a1b25") : Color.white)
                .shadow(radius: 5, x: 5, y: 0)
            
            HStack{
                VStack{
                    Text(title)
                        .font(.system(size: 18))
                        .foregroundStyle(Color.accentColor)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    if item.difficulty == "Easy"{
                        Text(difficulty)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.green)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    else if item.difficulty == "Medium"{
                        Text(difficulty)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.orange)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    else if item.difficulty == "Hard"{
                        Text(difficulty)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.red)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    
                }
                .padding([.top, .bottom])
                
                Image(systemName: data.contains(item) ? "heart.fill" : "heart")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.red)
                    .bold()
                    .onTapGesture{
                        data.toggleFavs(question: item)
                        if data.savedItems.isEmpty{
                            toggleFav.toggle()
                            data.sortFaves()
                        }
                        
                        
                    }
                    .padding()
                
            }
            .padding([.leading, .trailing])
            .contentShape(Rectangle())
            .listRowBackground(colorScheme == .dark ? Color.black : Color(hex: "#bdd5ea"))
        }
        
    }
}


#Preview {
    QuestionCardView(title: "Longest Consecutive Sequence", difficulty: "Easy", solutionLink: "", item: LeetCodeContent(question: "", categorie: "", difficulty: "Easy", solution: "", prompt: ""), isFaved: .constant(false), description: "Contains duplicate description.", showPrompt: .constant(false))
        .environmentObject(DataModel())
}
