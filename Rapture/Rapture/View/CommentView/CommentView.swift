//
//  CommentView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI

struct CommentView: View {
    
    @StateObject var commentService = CommentService()
    
    var post: Post?
    var postId: String?

    var body: some View {
        VStack {
            ScrollView {
                
                if !commentService.comments.isEmpty {
                    ForEach(commentService.comments) {
                        (comment) in
                        
                        CommentCard(comment: comment)
                    }
                } else {
                    Text("No Comments Yet...")
                        .font(Font.custom("Gilroy-Bold", size: 25))
                        .foregroundColor(Color("White"))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.5, alignment: .center)
                }
            }
            CommentInput(post: post, postId: postId)
        }
        .background(Color("Background").ignoresSafeArea(.all))
        .onAppear {
            self.commentService.postId = self.post == nil ? self.postId : self.post?.postId
            
            self.commentService.loadComments()
        }
        .onDisappear {
            if self.commentService.listener != nil {
                self.commentService.listener.remove()
            }
        }
    }
}
