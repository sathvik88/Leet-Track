//
//  KWayView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct KWayView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("K-way Merge helps you solve problems that involve a set of sorted arrays.")
                            .padding()
                        Text("Whenever you’re given ‘K’ sorted arrays, you can use a Heap to efficiently perform a sorted traversal of all the elements of all arrays. You can push the smallest element of each array in a Min Heap to get the overall minimum. After getting the overall minimum, push the next element from the same array to the heap. Then, repeat this process to make a sorted traversal of all elements.")
                            .padding()
                        Image("KWay")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        Text("The pattern looks like this:")
                            .font(.headline)
                        VStack{
                            Text("1. Insert the first element of each array in a Min Heap.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .leading, .trailing, .bottom])
                            Text("2. After this, take out the smallest (top) element from the heap and add it to the merged list.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                            Text("3. After removing the smallest element from the heap, insert the next element of the same list into the heap.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                            Text("4. Repeat steps 2 and 3 to populate the merged list in sorted order.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                        }
                        Text("How to identify the K-way Merge pattern:")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("The problem will feature sorted arrays, lists, or a matrix")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If the problem asks you to merge sorted lists, find the smallest element in a sorted list.")
                                .padding()
                                
                        }
                        
                    }
                }
                .navigationBarHidden(true)

            }
        }
    }
}

struct KWayView_Previews: PreviewProvider {
    static var previews: some View {
        KWayView()
    }
}
