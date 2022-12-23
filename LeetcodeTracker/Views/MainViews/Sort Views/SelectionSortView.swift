//
//  SelectionSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/22/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct SelectionSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Selection sort is a simple sorting algorithm that works by repeatedly selecting the smallest element from the unsorted portion of the list and placing it at the end of the sorted portion of the list.")
                            .padding()
                        Text("It's worth noting that selection sort has the advantage of being an in-place sorting algorithm, which means it does not require any additional space beyond the input list to sort the list. This can be useful in cases where space is limited or memory allocation is expensive. However, selection sort has a relatively slow time complexity compared to other sorting algorithms, so it may not be the best choice for large lists or lists that need to be sorted frequently.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "selectionSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding([.bottom],-100)
                        Text("Python implementation")
                            .font(.headline)
                            .padding()
                        Image("SelectionSort")
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
            
        }
    }
}

struct SelectionSortView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionSortView()
    }
}
