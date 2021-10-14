//
//  ProfileHeader.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    
    var user: User?
    
    var body: some View {
        VStack {
            if user != nil {
                WebImage(url: URL(string: user!.profileImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                    .padding()
            } else {
                Image(systemName: "person")
                    .font(.system(size: 65))
                    .foregroundColor(Color("White"))
                    .frame(width: 200, height: 200)
                    .background(Color("Red"))
                    .clipShape(Circle())
            }
            
            VStack {
                Text(user!.username)
                    .font(Font.custom("Gilroy-Bold", size: 30))
                    .foregroundColor(Color("White"))
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .padding(.bottom, 5)
                    .padding(.top, 15)
                
                Text(user!.email)
                    .font(Font.custom("Gilroy-Regular", size: 22))
                    .foregroundColor(Color("White"))
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            
            HStack(spacing: 40) {
                VStack {
                    Text("1.2k")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("following")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
                
                VStack {
                    Text("1.2k")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("followers")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
                
                VStack {
                    Text("33")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(Color("White"))
                        .padding(.bottom, 2)
                    
                    Text("posts")
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .foregroundColor(Color("White"))
                }
            }
            .padding()
            .padding(.top, 20)
        }
    }
}
