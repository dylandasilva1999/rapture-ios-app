//
//  ProfileService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/14.
//

import Foundation

class ProfileService: ObservableObject {
    
    @Published var posts: [Post] = []
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userId: userId) {
            (posts) in
            
            self.posts = posts
        }
    }
}
