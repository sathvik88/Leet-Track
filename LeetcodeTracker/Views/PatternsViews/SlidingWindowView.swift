//
//  SlidingWindowView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct SlidingWindowView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        Image("slidingwindow")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("The Sliding Window pattern is used to perform a required operation on a specific window size of a given array or linked list, such as finding the longest subarray containing all 1s. Sliding Windows start from the 1st element and keep shifting right by one element and adjust the length of the window according to the problem that you are solving. In some cases, the window size remains constant and in other the sizes grows or shrinks.")
                            .padding()
                        Text("Following are some ways you can identify that the given problem might require a sliding window:")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("The problem input is a linear data structure such as a linked list, array, or string")
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("You’re asked to find the longest/shortest substring, subarray, or a desired value")
                                
                        }
                        
                        
                    }
                }
                .navigationBarHidden(true)

            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
    
        
}

struct SlidingWindowView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingWindowView()
    }
}
