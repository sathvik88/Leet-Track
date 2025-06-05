//
//  QuestionCardView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 10/5/24.
//

import SwiftUI

struct QuestionCardView: View {
    @ObservedObject var data = DataModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var savedQuestions: FetchedResults<SavedQuestions>
    let title: String
    let difficulty: String
    let solutionLink: String
    let item: LeetCodeContent
    @Binding var isFaved: Bool
    let description: String
    @Binding var showPrompt: Bool
    @State var toggleFav: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State var fillHeart = false
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
                
                Image(systemName: fillHeart ? "heart.fill" : "heart")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.red)
                    .bold()
                    .onTapGesture{
                        
                        if fillHeart{
                            for i in savedQuestions{
                                if item.id == i.id{
                                    moc.delete(i)
                                    
                                    fillHeart = false
                                }
                            }
                        }else{
                            let savedquestions = SavedQuestions(context: moc)
                            savedquestions.id = UUID()
                            savedquestions.question = item.question
                            print(item.id)
                            do{
                                try? moc.save()
                            }
                            fillHeart = true
                        }
                        
                    }
                    .padding()
                
            }
            .padding([.leading, .trailing])
            .contentShape(Rectangle())
            .listRowBackground(colorScheme == .dark ? Color.black : Color(hex: "#bdd5ea"))
            .onAppear(){
                for i in savedQuestions{
                    if item.question == i.question{
                        fillHeart = true
                    }
                }
            }
        }
        
    }
}


#Preview {
    QuestionCardView(title: "Longest Consecutive Sequence", difficulty: "Easy", solutionLink: "", item: LeetCodeContent(question: "", categorie: "", difficulty: "Easy", solution: "", prompt: ""), isFaved: .constant(false), description: "Contains duplicate description.", showPrompt: .constant(false))
        .environmentObject(DataModel())
}
