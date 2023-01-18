//
//  QuickSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/15/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct QuickSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Quicksort is a divide-and-conquer sorting algorithm that works by selecting a pivot element from the list and partitioning the other elements into two sublists based on whether they are less than or greater than the pivot. The algorithm then recursively sorts the sublists.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "quickSort")
                            .scaledToFit()
                            .padding([.top,.bottom],-100)
                        Text("Python implementation")
                            .font(.headline)
                        Image("quickSort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        
                        
                        HStack{
                            Text("Time Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(nlogn)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }
                        HStack{
                            Text("Space Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(n)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }
                        
                    }
                    .padding(.top, 1)
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Quick Sort")
            
        }
    }
}

struct QuickSortView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSortView()
    }
}
