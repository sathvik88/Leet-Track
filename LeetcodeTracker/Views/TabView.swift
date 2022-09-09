//
//  TabView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI
import CoreData
struct TabViewScreen: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            BoardView()
                .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Board")
                }
            DSAlgoView()
                .tabItem{
                    Image(systemName: "book")
                    Text("Learn")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewScreen()
    }
}
