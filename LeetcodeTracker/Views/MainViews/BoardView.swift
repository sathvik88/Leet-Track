//
//  BoardView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI


struct BoardView: View {
    @StateObject private var board: Board = Board.stub
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                ScrollView(.horizontal){
                    LazyHStack(alignment: .top, spacing: 24){
                        ForEach(board.lists){ BoardList in
                            BoardListView(board: board, boardList: BoardList)
                        }
                        
                    }
                }
                .navigationTitle(board.name)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .previewInterfaceOrientation(.portrait)
            
    }
}
