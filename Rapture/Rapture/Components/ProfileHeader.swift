//
//  ProfileHeader.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    
    @EnvironmentObject var session: SessionStore
    var user: User?
    var postsCount: Int
    @State var isLinkActive = false
    
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        VStack {
            if user != nil {
                WebImage(url: URL(string: user!.profileImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 160, height: 160)
                    .padding()
                
                
            } else {
                Image(systemName: "person")
                    .font(.system(size: 65))
                    .foregroundColor(Color("White"))
                    .frame(width: 160, height: 160)
                    .background(Color("Red"))
                    .clipShape(Circle())
            }
            
            VStack {
                if user != nil {
                    Text(user!.username)
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .padding(.bottom, 2)
                        .padding(.top, 10)
                    
                    Text(user!.email)
                        .font(Font.custom("Gilroy-Regular", size: 22))
                        .foregroundColor(Color("White"))
                        .frame(width: UIScreen.main.bounds.width - 60)
                    
                    Text(user!.bio)
                        .font(Font.custom("Gilroy-Bold", size: 20))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .lineLimit(1)
                }
            }
            
            HStack(spacing: 40) {
                VStack {
                    Text("\(following)")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("following")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
                
                VStack {
                    Text("\(followers)")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("followers")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
                
                VStack {
                    Text("\(postsCount)")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("posts")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
            }
            .padding()
            .padding(.top, 10)
        }
    }
}
