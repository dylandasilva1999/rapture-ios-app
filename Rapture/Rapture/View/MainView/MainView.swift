//
//  MainView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    var body: some View {
        Text("Main")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//@EnvironmentObject var session: SessionStore
//@StateObject var profileService = ProfileService()
//
//var body: some View {
//    ScrollView {
//        VStack {
//            ForEach(self.profileService.posts, id: \.postId) {
//                (post) in
//
//                PostCardView(post: post)
//                    .frame(width: UIScreen.main.bounds.width - 55)
//            }
//        }
//    }
//    .onAppear {
//        self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
//    }
//}
