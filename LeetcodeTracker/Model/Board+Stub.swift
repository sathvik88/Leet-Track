//
//  Board+Stub.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import Foundation

extension Board{
    static var stub: Board{
        let board = Board(name: "Progress Tracker")
        let todoList = BoardList(name: "Todo List", boardID: board.id)
        let todoListCards = [
            "Test card",
            "Another Test Card"
        ].map{ Card(content: $0, boardListId: todoList.id)}
        todoList.cards = todoListCards
        //todoList.cards = todoListCards
        
        let reviewList = BoardList(name: "Review", boardID: board.id)
        let reviewCards = [
            "Test review"
        ].map{ Card(content: $0, boardListId: reviewList.id)}
        reviewList.cards = reviewCards
        
        let masteredList = BoardList(name: "Mastered", boardID: board.id)
        board.lists = [
            todoList,
            reviewList,
            masteredList
        ]
        
        return board
        
        
    }
}
