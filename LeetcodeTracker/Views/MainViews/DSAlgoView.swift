//
//  DSAlgoView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI

struct DSAlgoView: View {
    let patterns = [
            "Sliding Window",
            "Two Pointers",
            "Fast and Slow Pointers",
            "Merge Intervals",
            "Cyclic Sort",
            "In-place Reversal of Linked List",
            "Tree BFS",
            "Tree DFS",
            "Two Heaps",
            "Subsets",
            "Modified Binary Search",
            "Top K Elements",
            "K-way Merge",
            "Topological sort"
        ]
    var body: some View {
        NavigationView{
            List(patterns, id: \.self){ list in
                
                NavigationLink {
                    switch list{
                    case "Sliding Window":
                        SlidingWindowView()
                    case "Two Pointers":
                        TwoPointersView()
                    case "Fast and Slow Pointers":
                        FSView()
                    case "Merge Intervals":
                        MergeIntervalsView()
                    case "Cyclic Sort":
                        CyclicSortView()
                    case "In-Place Reversal of Linked List":
                        InPlaceView()
                    case "Tree BFS":
                        TreeBFSView()
                    case "Tree DFS":
                        TreeDFSView()
                    case "Two Heaps":
                        TwoHeapsView()
                    case "Subsets":
                        SubsetsView()
                    case "Modified Binary Search":
                        ModifiedBinaryView()
                    case "Top K Elements":
                        TopKView()
                    case "K-way Merge":
                        KWayView()
                    case "Topological sort":
                        TopologicalView()
                    default:
                        ContentView()
                    }
                } label: {
                    Text(list)
                }

            }
            .navigationTitle("Patterns")
        }
    }
}

struct DSAlgoView_Previews: PreviewProvider {
    static var previews: some View {
        DSAlgoView()
    }
}
