//
//  PostCardView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    WebImage(url: URL(string: post.profile)!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .padding(.leading, 35)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.username)
                            .font(Font.custom("Gilroy-Bold", size: 18))
                            .foregroundColor(Color("White"))
                        
                        Text((Date(timeIntervalSince1970: post.date)).timeAgo() + " ago")
                            .font(Font.custom("Gilroy-Regular", size: 14))
                            .foregroundColor(Color("White").opacity(0.4))
                    }
                    .padding(.top, 20)
                    .padding(.leading, 10)
                }
                .padding(.bottom, 15)
                
                WebImage(url: URL(string: post.mediaUrl)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 55, height: 400, alignment: .center)
                    .cornerRadius(30)
                    .clipped()
                    .padding(.leading, 35)
                    .padding(.trailing, 25)
                
                PostCard(post: post)
                    .frame(width: UIScreen.main.bounds.size.width)
                    .padding(.leading, 15)
                
                Text(post.caption)
                    .font(Font.custom("Gilroy-Regular", size: 20))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .padding(.bottom, 10)
            }
        }
    }
}
