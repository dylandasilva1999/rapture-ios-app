//
//  MainService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class MainService: ObservableObject {
    @Published var allPosts: [Post] = []
    
    func loadAllPosts() {
        AuthService.storeRoot.collection("allposts").getDocuments{
            (querysnapshot, error) in
            
            if let error = error{
                print(error)
            }else{
                self.allPosts = querysnapshot!.documents.map{ (querydocument) -> Post in
                    
                    let document = querydocument.data()
                    let caption = document["caption"] as? String ?? "No Caption Here"
                    let likes = document["likes"] as? [String: Bool] ?? ["": false]
                    let ownerID = document["ownerId"] as? String ?? "No Owner ID"
                    let postId = document["postId"] as? String ?? "No Post Id"
                    let username = document["username"] as? String ?? "No Username"
                    let profile = document["profile"] as? String ?? ""
                    let mediaUrl = document["mediaUrl"] as? String ?? "No Image"
                    let date = document["date"] as? Double ?? 0
                    let likeCount = document["likeCount"] as? Int ?? 0
                    
                    return Post(caption: caption, likes: likes, ownerId: ownerID, postId: postId, username: username, profile: profile, mediaUrl: mediaUrl, date: date, likeCount: likeCount)
                    
                }
            }
        }
    }
}
