//
//  SubsetsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct SubsetsView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("A huge number of coding interview problems involve dealing with Permutations and Combinations of a given set of elements. The pattern Subsets describes an efficient Breadth First Search (BFS) approach to handle all these problems.")
                            .padding()
                        Text("The pattern looks like this:")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Given a set of [1, 5, 3]")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        VStack{
                            Text("1. Start with an empty set: [[]]")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            Text("2. Add the first number (1) to all the existing subsets to create new subsets: [[], [1]];")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            Text("3. Add the second number (5) to all the existing subsets: [[], [1], [5], [1,5]];")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            Text("4. Add the third number (3) to all the existing subsets: [[], [1], [5], [1,5], [3], [1,3], [5,3], [1,5,3]].")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        
                        Text("Here is a visual representation of the Subsets pattern:")
                            .font(.headline)
                        Image("Subset")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        Text("How to identify the Subsets pattern:")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("Problems where you need to find the combinations or permutations of a given set")
                                .padding()
                                
                        }
                        
                    }
                }
                .padding(.top, 1)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("Subsets")

    }
}

struct SubsetsView_Previews: PreviewProvider {
    static var previews: some View {
        SubsetsView()
    }
}
