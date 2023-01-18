//
//  ModifiedBinaryView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct ModifiedBinaryView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Whenever you are given a sorted array, linked list, or matrix, and are asked to find a certain element, the best algorithm you can use is the Binary Search. This pattern describes an efficient way to handle all problems involving Binary Search.")
                            .padding()
                        Text("The patterns looks like this for an ascending order set:")
                            .font(.headline)
                        VStack{
                            Text("1. First, find the middle of start and end. An easy way to find the middle would be: middle = (start + end) / 2. But this has a good chance of producing an integer overflow so it’s recommended that you represent the middle as: middle = start + (end — start) / 2")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .leading, .trailing, .bottom])
                            Text("2. If the key is equal to the number at index middle then return middle.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                            Text("3. If ‘key’ isn’t equal to the index middle:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                            Text("4. Check if key < arr[middle]. If it is reduce your search to end = middle — 1")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                            Text("5. Check if key > arr[middle]. If it is reduce your search to end = middle + 1")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                        }
                        Text("Here is a visual representation of the Modified Binary Search pattern:")
                            .font(.headline)
                        Image("BinarySearch")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                    }
                }
                .padding(.top, 1)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("Modified Binary Search")
    }
}

struct ModifiedBinaryView_Previews: PreviewProvider {
    static var previews: some View {
        ModifiedBinaryView()
    }
}
