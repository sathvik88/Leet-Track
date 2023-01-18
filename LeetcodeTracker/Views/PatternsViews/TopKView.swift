//
//  TopKView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TopKView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Any problem that asks us to find the top/smallest/frequent ‘K’ elements among a given set falls under this pattern.")
                            .padding()
                        Text("The best data structure to keep track of ‘K’ elements is Heap. This pattern will make use of the Heap to solve multiple problems dealing with ‘K’ elements at a time from a set of given elements.")
                            .padding()
                        Text("The pattern looks like this:")
                            .font(.headline)
                        VStack{
                            Text("1. Insert ‘K’ elements into the min-heap or max-heap based on the problem.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .leading, .trailing, .bottom])
                            Text("2. Iterate through the remaining numbers and if you find one that is larger than what you have in the heap, then remove that number and insert the larger one.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing, .bottom])
                        }
                        Image("TopK")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("There is no need for a sorting algorithm because the heap will keep track of the elements for you.")
                            .padding()
                        
                    }
                    .padding(.top, 1)
                }
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Top K Elements")
        }
    }
}

struct TopKView_Previews: PreviewProvider {
    static var previews: some View {
        TopKView()
    }
}
