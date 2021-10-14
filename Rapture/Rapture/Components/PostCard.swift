//
//  PostCard.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import SwiftUI

struct PostCard: View {
    
    @ObservedObject var postCardService = PostCardService()
    
    @State var animate = false
    private let duration: Double = 0.2
    private var animatedScale: CGFloat {
        postCardService.isLiked ? 0.6 : 2.0
    }
    
    init(post: Post) {
        self.postCardService.post = post
        self.postCardService.hasLikedPost()
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Button(action: {
                        self.animate = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
                            self.animate = false
                            
                            if (self.postCardService.isLiked) {
                                self.postCardService.unlike()
                            } else {
                                self.postCardService.like()
                            }
                        })
                    }) {
                        Image(systemName: (self.postCardService.isLiked) ? "heart.fill" : "heart")
                            .frame(width: 30, height: 5, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor((self.postCardService.isLiked) ? Color("Red") : Color("White"))
                    }
                    .padding()
                    .scaleEffect(animate ? animatedScale : 1)
                    .animation(.easeIn(duration: duration))
                    
                    Image(systemName: "bubble.middle.bottom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("White"))
                        .frame(width: 16, height: 16, alignment: .center)
                }
                
                if (self.postCardService.post.likeCount > 0) {
                    Text("\(self.postCardService.post.likeCount) likes")
                        .foregroundColor(Color("White"))
                        .font(Font.custom("Gilroy-Regular", size: 18))
                        .padding(.bottom, 20)
                        .padding(.leading, 22)
                }
            }
            Spacer()
        }
    }
}
