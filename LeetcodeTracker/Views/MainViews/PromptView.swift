//
//  PromptView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/10/23.
//

import SwiftUI

struct PromptView: View {
    @Binding var showPrompt: Bool
    let prompt: String
    let solution: String
    let question: String
    var body: some View {
        NavigationView{
            VStack{
                Text(question)
                    .font(Font.title.bold())
                Spacer()
                GroupBox{
                    Text(prompt)
                    
                }
                
                .padding([.leading,.trailing])
                
                Spacer()
                
                Button{
                    UIApplication.shared.open(URL(string: solution)!)
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                            .frame(width: 358, height: 40)
                            .foregroundStyle(Color.accentColor)
                        
                        Text("View Solution")
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .padding([.leading, .trailing])
                    
                    
                }
                .padding(.bottom)
                
                
            }
        }
        
    }
}
#Preview {
    PromptView(showPrompt: .constant(false), prompt: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", solution: "", question: "What is Lorem Ipsum?")
}


