//
//  CyclicSortView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct CyclicSortView: View {
    var body: some View {
        
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("This pattern describes an interesting approach to deal with problems involving arrays containing numbers in a given range. The Cyclic Sort pattern iterates over the array one number at a time, and if the current number you are iterating is not at the correct index, you swap it with the number at its correct index. You could try placing the number in its correct index, but this will produce a complexity of O(n^2) which is not optimal, hence the Cyclic Sort pattern.")
                            .padding()
                        Image("CycleSort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        Text("How do I identify this pattern?")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("They will be problems involving a sorted array with numbers in a given range")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If the problem asks you to find the missing/duplicate/smallest number in an sorted/rotated array.")
                                .padding()
                                
                        }
                        
                        
                    }
                }
                .navigationBarHidden(true)

            }
        }
    }
}

struct CyclicSortView_Previews: PreviewProvider {
    static var previews: some View {
        CyclicSortView()
    }
}
