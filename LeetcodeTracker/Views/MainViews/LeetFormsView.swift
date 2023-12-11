//
//  LeetFormsView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/10/23.
//

import SwiftUI
import WebKit
struct LeetFormsView: View {
    var body: some View {
        NavigationStack{
            WebView(url: URL(string: "https://leetcode.com/discuss/interview-question?currentPage=1&orderBy=hot&query=")!)
                .navigationTitle("LeetTrack")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LeetFormsView_Previews: PreviewProvider {
    static var previews: some View {
        LeetFormsView()
    }
}
