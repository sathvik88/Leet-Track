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
                    .padding([.bottom],80)
                    .padding([.top],30)
                    
                GroupBox{
                    Text(prompt)
                        
                }
                .padding([.bottom],200)
                .padding([.leading,.trailing],20)
                Spacer()
                    .frame(height: 100)
                
                
                Button{
                    UIApplication.shared.open(URL(string: solution)!)
                    
                    
                } label: {
                    Text("View Solution")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}


