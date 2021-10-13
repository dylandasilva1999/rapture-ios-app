//
//  Post.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import Foundation

struct Post: Encodable, Decodable {
    var caption: String
    var likes: [String: Bool]
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
}
