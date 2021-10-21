//
//  CommentInput.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentInput: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var commentService = CommentService()
    @State private var text: String = ""
    
    init(post: Post?, postId: String?) {
        if post != nil {
            commentService.post = post
        } else {
            handleInput(postId: postId!)
        }
    }
    
    func handleInput(postId: String) {
        PostService.loadPost(postId: postId) {
            (post) in
            
            self.commentService.post = post
        }
    }
    
    func sendComment() {
        if !text.isEmpty {
            commentService.addComment(comment: text) {
                self.text = ""
            }
        }
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: session.session!.profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.leading, 20)
                .padding(.trailing, 10)
            
            HStack {
                TextEditor(text: $text)
                    .foregroundColor(Color("White"))
                    .frame(height: 50)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 20, style: .circular).stroke(Color("Red"), lineWidth: 3.0))
                
                Button(action: {
                    sendComment()
                }) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .padding(.trailing, 20)
                        .padding(.leading, 10)
                        .foregroundColor(Color("Red"))
                }
            }
        }
    }
}
