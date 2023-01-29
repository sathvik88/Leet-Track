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
                        
            StatsView(lineWidth: 5, fontSize: 15)
                
        } else{
            ZStack{
                
                VStack{
                    Text("View Your Stats!")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .padding(.bottom, 120)
                    TextField("Leetcode Username", text: $username)
                        .focused($isFocused)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .onChange(of: username) { newValue in
                                        username = newValue.replacingOccurrences(of: " ", with: "")
                                    }
                    
                    Button(action: {
                        Task{
                            await data.loadStats(name: username)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            login = true
                            
                        }
                        
                        isFocused = false
                        
                    }, label: {
                        Text("Login")
                            .frame(width: 300, height: 50)
                    })
                    
                    .foregroundColor(.white)
                    
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                    
                }
            }
        }
        
    }
   
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserAuth())
            .environmentObject(NotificationManager())
        
    }
}
