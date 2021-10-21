//
//  UserProfileView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAuth

struct UserProfileView: View {
    
    var user: User
    
    @State private var selection = 0
    @StateObject var profileService = ProfileService()
    
    var columns = [GridItem(.flexible(minimum: 120), spacing: 0),
                   GridItem(.flexible(minimum: 120), spacing: 0)]
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(user: user, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
                
                FollowButton(user: user, followCheck: $profileService.followCheck, followingCount: $profileService.following, followersCount: $profileService.followers)
                
                Picker("", selection: $selection) {
                    Text("grid")
                        .tag(0)
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                    Text("single")
                        .tag(1)
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: UIScreen.main.bounds.width/1.15)
                .foregroundColor(Color("Red"))
                .padding(.top, 20)
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.horizontal)
            
            VStack {
                if selection  == 0 {
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
                } else {
                    ScrollView {
                        VStack {
                            ForEach(self.profileService.posts, id: \.postId) {
                                (post) in
                                
                                PostCardView(post: post)
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width/1.1)
            .padding(.top, 20)
        }
        .background(Color("Background").ignoresSafeArea(.all))
        .accentColor(Color("Red"))
        .onAppear {
            self.profileService.loadUserPosts(userId: self.user.uid)
        }
    }
}
