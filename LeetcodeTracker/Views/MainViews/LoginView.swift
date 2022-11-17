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
    @State private var login = false
    @State private var username: String = ""
    @EnvironmentObject  var userAuth: UserAuth
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                NavigationLink(destination: StatsView(username: username), isActive: $login) {
                     Text("Go")
                }.buttonStyle(PlainButtonStyle())
                    .simultaneousGesture(TapGesture().onEnded{

                        self.userAuth.login()
                        
                    })
            }
            
        }
        

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserAuth())
    }
}
