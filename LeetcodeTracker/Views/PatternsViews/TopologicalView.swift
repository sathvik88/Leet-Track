//
//  TopologicalView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 9/26/22.
//

import SwiftUI

struct TopologicalView: View {
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ScrollView{
                        
                        Text("Topological Sort is used to find a linear ordering of elements that have dependencies on each other. For example, if event ‘B’ is dependent on event ‘A’, ‘A’ comes before ‘B’ in topological ordering.")
                            .padding()
                        Text("This pattern defines an easy way to understand the technique for performing topological sorting of a set of elements.")
                            .padding()
                        Text("The pattern works like this:")
                            .font(.headline)
                        Image("TopoSort")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                        
                    }
                }
                .navigationBarHidden(true)

            }
        }
    }
}

struct TopologicalView_Previews: PreviewProvider {
    static var previews: some View {
        TopologicalView()
    }
}
