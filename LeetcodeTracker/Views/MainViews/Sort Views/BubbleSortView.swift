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
                        
                        Text("Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in the wrong order. This algorithm is not suitable for large data sets as its average and worst-case time complexity is quite high.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "bubbleSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        HStack{
                            Text("Time Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(n^2)")
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

struct BubbleSortView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleSortView()
    }
}
