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
    
    var body: some View {
        
        if login{
            
            StatsView( stats: data.stats)
                .task {
                    await data.loadStats(name: username)
                }
        } else{

                VStack {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($isFocused)
                    Button("Go") {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            login = true
                        }
                        
                        isFocused = false
                        
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
