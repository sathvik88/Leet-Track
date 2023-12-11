//
//  WebView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/10/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context){
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
