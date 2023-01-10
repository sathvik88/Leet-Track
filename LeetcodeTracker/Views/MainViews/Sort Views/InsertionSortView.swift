//
//  InsertionSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/22/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct InsertionSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Insertion sort is an in-place comparison-based sorting algorithm. It works by iterating through the elements of a list, and inserting each element into its correct position in a sorted sublist.")
                            .padding()
                        Text("Overall, insertion sort is not a particularly efficient sorting algorithm, especially when compared to more advanced algorithms such as quicksort or merge sort. However, it can be useful in certain situations where the list to be sorted is small or partially sorted, as it has a relatively low overhead and is easy to implement.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "insertionSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding([.bottom],-100)
                        Text("Python implementation")
                            .font(.headline)
                            .padding()
                        Image("InsertionSort")
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

struct InsertionSortView_Previews: PreviewProvider {
    static var previews: some View {
        InsertionSortView()
    }
}
