//
//  MergeSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/20/22.
//

import SwiftUI
import SSSwiftUIGIFView
struct MergeSortView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("The Merge Sort algorithm is a sorting algorithm that is based on the Divide and Conquer paradigm. In this algorithm, the array is initially divided into two equal halves and then they are combined in a sorted manner.")
                            .padding()
                        SwiftUIGIFPlayerView(gifName: "MergeSort")
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding([.top,.bottom],-100)
                        Text("Python implementation")
                            .font(.headline)
                            .padding()
                        Image("Top-DownMergesort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        
                        HStack{
                            Text("Time Complexity: ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .padding(.leading,10)
                            Text("O(Nlog(N))")
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
            .navigationTitle("Merge Sort")
            
        }
    }
}

struct MergeSortView_Previews: PreviewProvider {
    static var previews: some View {
        MergeSortView()
    }
}
