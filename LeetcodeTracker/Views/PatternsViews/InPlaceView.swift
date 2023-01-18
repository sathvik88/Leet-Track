//
//  InPlaceView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct InPlaceView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("In a lot of problems, you may be asked to reverse the links between a set of nodes of a linked list. Often, the constraint is that you need to do this in-place, i.e., using the existing node objects and without using extra memory. This is where the above mentioned pattern is useful.")
                            .padding()
                        Text("This pattern reverses one node at a time starting with one variable (current) pointing to the head of the linked list, and one variable (previous) will point to the previous node that you have processed. In a lock-step manner, you will reverse the current node by pointing it to the previous before moving on to the next node. Also, you will update the variable “previous” to always point to the previous node that you have processed.")
                            .padding()
                        Image("InPlace")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        Text("How do I identify this pattern?")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If you’re asked to reverse a linked list without using extra memory")
                                .padding()
                                
                        }
                        
                    }
                    .padding(.top, 1)
                }
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("In-Place Reversal")
        }
    }
}

struct InPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        InPlaceView()
    }
}
