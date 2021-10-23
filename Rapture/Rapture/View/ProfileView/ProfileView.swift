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
    @State private var selection = 0
    @StateObject var profileService = ProfileService()
    @ObservedObject var mainService = MainService()
    @State var isLinkActive = false
    
    var columns = [GridItem(.flexible(minimum: 120), spacing: 0),
                   GridItem(.flexible(minimum: 120), spacing: 0)]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Red"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UINavigationBar.appearance().tintColor = UIColor(Color("White"))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(user: self.session.session, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
                
                HStack {
                    NavigationLink(destination: EditProfileView(session: self.session.session), isActive: $isLinkActive) {
                        Button(action: {
                            self.isLinkActive = true
                        }) {
                            Text("edit profile")
                                .font(Font.custom("Gilroy-SemiBold", size: 22))
                                .foregroundColor(.white)
                                .padding(.vertical, 25)
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(.top, 20)
                        .shadow(color: Color("Red").opacity(0.4), radius: 15)
                    }
                    .accentColor(Color("White"))
                    
                    Button(action: {
                        self.session.logout()
                    }) {
                        Text("sign out")
                            .font(Font.custom("Gilroy-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical, 25)
                            .frame(maxWidth: .infinity)
                    }
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("Red"), lineWidth: 3))
                    .cornerRadius(20)
                    .padding(.top, 20)
                    .shadow(color: Color("Red").opacity(0.4), radius: 15)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: UIScreen.main.bounds.width - 60)

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
                    if (self.session.session == nil) {
                        Text("")
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
