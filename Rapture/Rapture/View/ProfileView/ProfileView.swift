//
//  ProfileView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    @StateObject var profileService = ProfileService()
    
    var columns = [GridItem(.flexible(minimum: 120), spacing: 0),
                   GridItem(.flexible(minimum: 120), spacing: 0)]
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(user: self.session.session)
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.horizontal)
            
            VStack {
                if selection  == 1 {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                        ForEach(self.profileService.posts, id: \.postId) {
                            (post) in
                            
                            WebImage(url: URL(string: post.mediaUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/4)
                                .cornerRadius(20)
                                .padding(.bottom, 22)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width/1.1)
            .padding(.top, 20)
        }
        .onAppear {
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
