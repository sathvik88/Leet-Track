//
//  DSAlgoView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI

struct myPatterns: Identifiable{
    let id = UUID()
    let name: String
    var destination: AnyView
}
struct mySortingViews: Identifiable{
    let id = UUID()
    let name: String
    var destination: AnyView
}
struct DSAlgoView: View {
    
        
    
    let patterns: [myPatterns] = [ myPatterns(name: "Sliding Window", destination: AnyView(SlidingWindowView())),
                               myPatterns(name: "Two Pointers", destination: AnyView(TwoPointersView())),
                               myPatterns(name: "Fast and Slow Pointers", destination: AnyView(FSView())),
                               myPatterns(name: "Merge Intervals", destination: AnyView(MergeIntervalsView())),
                               myPatterns(name: "Cyclic Sort", destination: AnyView(CyclicSortView())),
                               myPatterns(name: "In-Place Reversal of Linked List", destination: AnyView(InPlaceView())),
                               myPatterns(name: "Tree BFS", destination: AnyView(TreeBFSView())),
                               myPatterns(name: "Tree DFS", destination: AnyView(TreeDFSView())),
                               myPatterns(name: "Two Heaps", destination: AnyView(TwoHeapsView())),
                               myPatterns(name: "Subsets", destination: AnyView(SubsetsView())),
                               myPatterns(name: "Modified Binary Search", destination: AnyView(ModifiedBinaryView())),
                               myPatterns(name: "Top K Elements", destination: AnyView(TopKView())),
                               myPatterns(name: "K-way Merge", destination: AnyView(KWayView())),
                               myPatterns(name: "Topological sort", destination: AnyView(TopologicalView()))
    ]
    let sortingViews: [mySortingViews] = [ mySortingViews(name: "Bubble Sort", destination: AnyView(BubbleSortView())),
                               mySortingViews(name: "Quick Sort", destination: AnyView(QuickSortView())),
                               mySortingViews(name: "Merge Sort", destination: AnyView(MergeSortView())),
                               mySortingViews(name: "Heap Sort", destination: AnyView(HeapSortView())),
                               mySortingViews(name: "Selection Sort", destination: AnyView(SelectionSortView())),
                               mySortingViews(name: "Insertion Sort", destination: AnyView(InsertionSortView())),
                               
    ]
    var body: some View {
        
            NavigationView{
                List{
                    Section("Patterns"){
                        ForEach(patterns){ item in
                            NavigationLink(destination: item.destination, label: {
                                Text(item.name)
                            })
                        }
                    }
                    Section("Sorting Alorithms"){
                        ForEach(sortingViews){ item in
                            NavigationLink(destination: item.destination, label: {
                                Text(item.name)
                            })
                        }
                    }
                }
                .navigationTitle("")

            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

struct DSAlgoView_Previews: PreviewProvider {
    static var previews: some View {
        DSAlgoView()
            .environmentObject(NotificationManager())
    }
}


