//
//  LoginView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/7/22.
//

import SwiftUI
import Combine



struct LoginView: View {
    @StateObject var data = DataModel()
    @AppStorage("login") private var login: Bool = false
    @AppStorage("username") private var username: String = ""
    @EnvironmentObject  var userAuth: UserAuth
    @FocusState private var isFocused: Bool
    @State var isDisabled = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        if login{
                        
            StatsView( stats: data.stats, subs: data.subs)
                
        } else{
            ZStack{
                
                VStack{
                    Text("Login to Leetcode!")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .focused($isFocused)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Button("Login"){
                        Task{
                            await data.loadStats(name: username)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            login = true
                            
                        }
                        
                        isFocused = false
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    Button("Register"){
                        openURL(URL(string: "https://leetcode.com/accounts/signup/")!)
                        
                    }
                    .padding()
                    
                }
            }
        }
        
    }
   
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserAuth())
    }
}
