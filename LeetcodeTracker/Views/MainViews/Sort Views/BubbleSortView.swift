//
//  BubbleSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/29/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct BubbleSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        Text("Bubble sort is a simple sorting algorithm that works by repeatedly iterating through the elements of a list and swapping adjacent elements that are out of order. The algorithm repeats this process until the list is sorted.")
                            .padding()
                        Text("Overall, bubble sort is not a particularly efficient sorting algorithm, especially when compared to more advanced algorithms such as quicksort or merge sort. However, it can be useful in certain situations where the list to be sorted is small or partially sorted, as it has a relatively low overhead and is easy to implement.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "bubbleSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("Python implementation")
                            .font(.headline)
                        Image("BubbleSort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        
                        HStack{
                            Text("Time Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(n^2)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }
                        HStack{
                            Text("Space Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(1)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }

                    }
                }
                .navigationBarHidden(true)

            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct BubbleSortView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleSortView()
    }
}
