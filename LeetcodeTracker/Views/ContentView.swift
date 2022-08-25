//
//  ContentView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI
import CoreData
import SafariServices

struct ContentView: View {
    
    @ObservedObject var data = DataModel()
    @State var showSafari = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(data.jsonData) { list in
                    HStack{
                        Button {
                            self.showSafari = true
                        } label: {
                            Text(list.question)
                                .fontWeight(.medium)
                        }
                        .sheet(isPresented: $showSafari){
                            SafariView(url:URL(string: list.solution)!)
                        }
                        Spacer()
                        
                        VStack(alignment: .center){
                            
                            if(list.difficulty == "Easy"){
                                Text(list.difficulty)
                                    .foregroundColor(.green)
                                    .fontWeight(.medium)
                            }
                            else if(list.difficulty == "Medium"){
                                Text(list.difficulty)
                                    .foregroundColor(.orange)
                                    .fontWeight(.medium)
                            }
                            else{
                                Text(list.difficulty)
                                    .foregroundColor(.red)
                                    .fontWeight(.medium)
                            }
                            
                        }
                        Spacer()
                        Image(systemName: data.contains(list) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .onTapGesture{
                                data.toggleFavs(question: list)
                            }
                    }
                }
            }
            .navigationBarTitle("Questions")
            
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
