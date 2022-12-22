//
//  HeapSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/20/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct HeapSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Heap sort is a comparison-based sorting algorithm that uses a data structure called a heap to sort a list of elements. A heap is a complete binary tree in which the elements are stored in a specific order such that the value of any element is less than or equal to the values of its children. There are two types of heaps: max heaps and min heaps. In a max heap, the root node (the topmost element) has the largest value, while in a min heap, the root node has the smallest value.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "heapSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding([.bottom],-100)
                        Text("Python implementation")
                            .font(.headline)
                            .padding()
                        Image("HeapSort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        
                        HStack{
                            Text("Time Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(nlog(n)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }
                        HStack{
                            Text("Space Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(1)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }

                    }
                }
                .navigationBarHidden(true)

            }
            
        }
    }
}

struct HeapSortView_Previews: PreviewProvider {
    static var previews: some View {
        HeapSortView()
    }
}
