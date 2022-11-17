//
//  DecideView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/11/22.
//

import SwiftUI

struct DecideView: View {
    @State private var isLoading = false
    @State var pushNewView: Bool = false
    var body: some View {
        NavigationView{
            NavigationLink(isActive: $pushNewView) {
                
            } label: {
                ProgressView()
                    //Replace with some animation content
            }
            
            
        }
        
    }
    
    
}

struct DecideView_Previews: PreviewProvider {
    static var previews: some View {
        DecideView()
    }
}
