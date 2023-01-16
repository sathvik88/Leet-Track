//
//  PromptView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 1/10/23.
//

import SwiftUI

struct PromptView: View {
    let prompt: String
    let solution: String
    let question: String
    var body: some View {
        NavigationView{
            VStack{
                Text(question)
                    .font(.headline)
                    .padding()
                Text(prompt)
                    .padding([.bottom],400)
                    .padding([.leading,.trailing],20)
                    .foregroundColor(.white)
                
                Button{
                    UIApplication.shared.open (URL(string: solution)!)
                } label: {
                    Text("View Solution")
                }
                
            }
        }
        
    }
}


