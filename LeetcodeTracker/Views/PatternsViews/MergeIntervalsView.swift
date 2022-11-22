//
//  MergeIntervalsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct MergeIntervalsView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("The Merge Intervals pattern is an efficient technique to deal with overlapping intervals. In a lot of problems involving intervals, you either need to find overlapping intervals or merge intervals if they overlap. The pattern works like this:")
                            .padding()
                        Text("Given two intervals (‘a’ and ‘b’), there will be six different ways the two intervals can relate to each other:")
                            .padding()
                        Image("MergeIntervals")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("Understanding and recognizing these six cases will help you help you solve a wide range of problems from inserting intervals to optimizing interval merges.")
                            .padding()
                        Text("How do you identify when to use the Merge Intervals pattern?")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If you’re asked to produce a list with only mutually exclusive intervals")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If you hear the term “overlapping intervals.")
                                .padding()
                                
                        }
                        
                        
                    }
                }
                .navigationBarHidden(true)

            }
            
        }
    }
}

struct MergeIntervalsView_Previews: PreviewProvider {
    static var previews: some View {
        MergeIntervalsView()
    }
}
