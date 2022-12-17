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
                        
                        Text("Quicksort is a sorting algorithm that works by partitioning the elements of a list into two groups, based on a pivot value, and then recursively sorting the groups.")
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
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(nlogn)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                        }
                        
                    }
                }
                .navigationBarHidden(true)

            }
            
        }
    }
}

struct QuickSortView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSortView()
    }
}
