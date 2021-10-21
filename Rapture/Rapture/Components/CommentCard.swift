//
//  Comment.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentCard: View {
    
    var comment: Comment
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: comment.profile)!)
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.leading, 20)
            
            VStack(alignment: .leading) {
                Text(comment.username)
                    .font(Font.custom("Gilroy-Bold", size: 20))
                    .foregroundColor(Color("White"))
                
                Text(comment.comment)
                    .font(Font.custom("Gilroy-Regular", size: 16))
                    .foregroundColor(Color("White"))
                    .padding(.top, 0.5)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text((Date(timeIntervalSince1970: comment.date)).timeAgo() + " ago")
                .font(Font.custom("Gilroy-Bold", size: 14))
                .foregroundColor(Color("White"))
                .padding(.trailing, 20)
            
        }
        .padding(.bottom, 15)
    }
}
