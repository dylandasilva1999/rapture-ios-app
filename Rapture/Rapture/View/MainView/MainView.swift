//
//  MainView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()
    @ObservedObject var mainService = MainService()
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Feed")
                    .font(Font.custom("Gilroy-Bold", size: 30))
                    .foregroundColor(Color("White"))
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            
            VStack {
                ForEach(self.mainService.allPosts, id: \.postId) {
                    (allPosts) in
                    
                    PostCardView(post: allPosts)
                        .frame(width: UIScreen.main.bounds.width - 55)
                }
            }
        }
        .onAppear {
            self.mainService.loadAllPosts()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
