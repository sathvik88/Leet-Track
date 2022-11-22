//
//  TwoHeapsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TwoHeapsView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("In many problems, we are given a set of elements such that we can divide them into two parts. To solve the problem, we are interested in knowing the smallest element in one part and the biggest element in the other part. This pattern is an efficient approach to solve such problems.")
                            .padding()
                        Text("This pattern uses two heaps; A Min Heap to find the smallest element and a Max Heap to find the biggest element. The pattern works by storing the first half of numbers in a Max Heap, this is because you want to find the largest number in the first half. You then store the second half of numbers in a Min Heap, as you want to find the smallest number in the second half. At any time, the median of the current list of numbers can be calculated from the top element of the two heaps.")
                            .padding()
                        
                        
                        Text("Ways to identify the Two Heaps pattern:")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("Useful in situations like Priority Queue, Scheduling.")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If the problem states that you need to find the smallest/largest/median elements of a set.")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("Sometimes, useful in problems featuring a binary tree data structure Problems featuring.")
                                .padding()
                                
                        }

                        
                    }
                }
                .navigationBarHidden(true)

            }
        }

    }
}

struct TwoHeapsView_Previews: PreviewProvider {
    static var previews: some View {
        TwoHeapsView()
    }
}
