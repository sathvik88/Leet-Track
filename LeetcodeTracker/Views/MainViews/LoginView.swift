import SwiftUI
import Combine



struct LoginView: View {
    @StateObject var data = DataModel()
    @AppStorage("login") private var login: Bool = false
    @AppStorage("username") private var username: String = ""
    @EnvironmentObject  var userAuth: UserAuth
    @FocusState private var isFocused: Bool
    @State var isDisabled = false
    @State var progressLoad = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        if login{
                        
            StatsView(lineWidth: 5, fontSize: 15)
                
        } else{
            GeometryReader{ proxy in
                ZStack(alignment: .center){
                                
                    VStack(alignment: .center){
                                    Spacer()
                                    Text("View Your Stats!")
                                        .font(.largeTitle)
                                        .bold()
                                        .padding()
                                    
                                    if progressLoad{
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                            .padding()
                                    }
                                    TextField("Leetcode Username", text: $username)
                                        .focused($isFocused)
                                        .padding()
                                        .frame(width: proxy.size.width/1.5, height: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .onChange(of: username) { newValue in
                                                        username = newValue.replacingOccurrences(of: " ", with: "")
                                                    }
                                    
                                    Button(action: {
                                        progressLoad.toggle()
                                        Task{
                                            await data.loadStats(name: username)
                                        }
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                            login = true
                                            progressLoad.toggle()
                                            
                                        }
                                        
                                        isFocused = false
                                        
                                    }, label: {
                                        Text("Login")
                                            .frame(width: proxy.size.width/3, height: 50)
                                    })
                                    
                                    
                                    .foregroundColor(.white)
                                    
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .padding()
                                    Spacer()
                                    
                                }
                                
                            }
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
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
