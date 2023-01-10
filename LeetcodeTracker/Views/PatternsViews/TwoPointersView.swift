//
//  TwoPointersView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TwoPointersView: View {
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    VStack{
                        Text("Two Pointers is a pattern where two pointers iterate through the data structure in tandem until one or both of the pointers hit a certain condition.Two Pointers is often useful when searching pairs in a sorted array or linked list; for example, when you have to compare each element of an array to its other elements.")
                            .padding()
                    
                        Text("Two pointers are needed because with just pointer, you would have to continually loop back through the array to find the answer. This back and forth with a single iterator is inefficient for time and space complexity — a concept referred to as asymptotic analysis. While the brute force or naive solution with 1 pointer would work, it will produce something along the lines of O(n²). In many cases, two pointers can help you find a solution with better space or runtime complexity.")
                            .padding()
                        Image("TwoPointers")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("Ways to identify when to use the Two Pointer method:")
                            .font(.headline)
                            
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("The problem input is a linear data structure such as a linked list, array, or string")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("The set of elements in the array is a pair, a triplet, or even a subarray")
                                .padding()
                                
                        }

                        
                    }
                }
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct TwoPointersView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPointersView()
    }
}
