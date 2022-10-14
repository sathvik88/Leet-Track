//
//  SlidingWindowView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct SlidingWindowView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                ScrollView{
                    Image("slidingwindow")
                        .resizable()
                        .scaledToFit()
                    if #available(iOS 16.0, *) {
                        
                        Text("The Sliding Window pattern is used to perform a required operation on a specific window size of a given array or linked list, such as finding the longest subarray containing all 1s. Sliding Windows start from the 1st element and keep shifting right by one element and adjust the length of the window according to the problem that you are solving. In some cases, the window size remains constant and in other the sizes grows or shrinks.")
                        
                    } else {
                        // Fallback on earlier versions
                        Text("The Sliding Window pattern is used to perform a required operation on a specific window size of a given array or linked list, such as finding the longest subarray containing all 1s. Sliding Windows start from the 1st element and keep shifting right by one element and adjust the length of the window according to the problem that you are solving. In some cases, the window size remains constant and in other the sizes grows or shrinks.")
                            .lineSpacing(10)
                            .multilineTextAlignment(.leading)
                        
                            .font(Font.body.bold())
                            
                    }
                    
                }
                .navigationTitle("Sliding Window")
            }
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
        
}

struct SlidingWindowView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingWindowView()
    }
}
