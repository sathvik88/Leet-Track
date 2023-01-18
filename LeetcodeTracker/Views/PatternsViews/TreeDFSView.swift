//
//  TreeDFSView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TreeDFSView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Tree DFS is based on the Depth First Search (DFS) technique to traverse a tree.")
                            .padding()
                        Text("You can use recursion (or a stack for the iterative approach) to keep track of all the previous (parent) nodes while traversing.")
                            .padding()
                        Text("The Tree DFS pattern works by starting at the root of the tree, if the node is not a leaf you need to do three things:")
                            .padding()
                        Text("1. Decide whether to process the current node now (pre-order), or between processing two children (in-order) or after processing both children (post-order).")
                            .padding()
                        Text("2. Make two recursive calls for both the children of the current node to process them.")
                            .padding()
                        Image("DFS")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        Text("How to identify the Tree DFS pattern?")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If you’re asked to traverse a tree with in-order, preorder, or postorder DFS")
                                .padding()
                                
                        }
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If the problem requires searching for something where the node is closer to a leaf")
                                .padding()
                                
                        }
                        
                    }
                    .padding(.top, 1)
                }
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Tree DFS")
        }

    }
}

struct TreeDFSView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDFSView()
    }
}
