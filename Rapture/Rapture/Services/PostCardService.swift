//
//  PostCardService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import Foundation
import Firebase
import SwiftUI

class PostCardService : ObservableObject {
    @Published var post : Post!
    @Published var isLiked = false
    
    func hasLikedPost() {
        isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true : false
    }
    
    func like() {
        post.likeCount += 1
        isLiked = true
        
        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
        
        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
        
        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
    }
    
    func unlike() {
        post.likeCount -= 1
        isLiked = false
        
        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
        
        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
        
        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
    }
}
