//
//  TreeBFSView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TreeBFSView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("This pattern is based on the Breadth First Search (BFS) technique to traverse a tree and uses a queue to keep track of all the nodes of a level before jumping onto the next level. Any problem involving the traversal of a tree in a level-by-level order can be efficiently solved using this approach.")
                            .padding()
                        Text("The Tree BFS pattern works by pushing the root node to the queue and then continually iterating until the queue is empty. For each iteration, we remove the node at the head of the queue and “visit” that node. After removing each node from the queue, we also insert all of its children into the queue.")
                            .padding()
                        Image("BFS")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                        Text("How to identify the Tree BFS pattern?")
                            .font(.headline)
                         
                        HStack{
                            Text("•")
                                .padding()
                                .font(.system(size: 30))
                                .frame(alignment: .trailing)
                            Text("If you’re asked to traverse a tree in a level-by-level fashion (or level order traversal)")
                                .padding()
                                
                        }
                        
                    }
                }
                .navigationBarHidden(true)

            }
        }
    }
}

struct TreeBFSView_Previews: PreviewProvider {
    static var previews: some View {
        TreeBFSView()
    }
}
