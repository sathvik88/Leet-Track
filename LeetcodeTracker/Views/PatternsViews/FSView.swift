//
//  FSView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct FSView: View {
    var body: some View {
        ZStack{
            NavigationView{
                if #available(iOS 16.0, *) {
                    VStack{
                        ScrollView{
                            
                            Text("The Fast and Slow pointer approach, also known as the Hare & Tortoise algorithm, is a pointer algorithm that uses two pointers which move through the array (or sequence/linked list) at different speeds. This approach is quite useful when dealing with cyclic linked lists or arrays.")
                                .padding()
                            Text("By moving at different speeds (say, in a cyclic linked list), the algorithm proves that the two pointers are bound to meet. The fast pointer should catch the slow pointer once both the pointers are in a cyclic loop..")
                                .padding()
                            Image("FastandSlow")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                            Text("How do you identify when to use the Fast and Slow pattern?")
                                .font(.headline)
                            
                            HStack{
                                Text("•")
                                    .padding()
                                    .font(.system(size: 30))
                                
                                Text("The problem will deal with a loop in a linked list or array.")
                                    .padding()
                                
                            }
                            HStack{
                                Text("•")
                                    .padding()
                                    .font(.system(size: 30))
                                    .frame(alignment: .trailing)
                                Text("When you need to know the position of a certain element or the overall length of the linked list.")
                                    .padding()
                                
                            }
                            Text("When should I use it over the Two Pointer method mentioned above?")
                                .font(.headline)
                                .padding()
                            HStack{
                                Text("•")
                                    .padding()
                                    .font(.system(size: 30))
                                    .frame(alignment: .trailing)
                                Text("There are some cases where you shouldn’t use the Two Pointer approach such as in a singly linked list where you can’t move in a backwards direction. An example of when to use the Fast and Slow pattern is when you’re trying to determine if a linked list is a palindrome.")
                                    .padding()
                                
                            }
                            
                        }
                    }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct FSView_Previews: PreviewProvider {
    static var previews: some View {
        FSView()
    }
}
