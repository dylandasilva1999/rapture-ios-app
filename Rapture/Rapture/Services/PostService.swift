//
//  PostService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class PostService {
    
    static var Posts = AuthService.storeRoot.collection("posts")
    
    static var AllPosts = AuthService.storeRoot.collection("allposts")
    @Published var allPosts: [Post] = []
    
    static var TimeLine = AuthService.storeRoot.collection("timeline")
    
    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }
    
    static func PostsId(postId: String) -> DocumentReference {
        return AllPosts.document(postId)
    }
    
    static func timelineUserId(userId: String) -> DocumentReference {
        return TimeLine.document(userId)
    }
    
    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
    }
        
        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
        
        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.savePostImage(userId: userId, caption: caption, postId: postId, imageData: imageData, metaData: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
        
    }
    
    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [Post]) -> Void) {
        
        PostService.PostsUserId(userId: userId).collection("posts").getDocuments {
            (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            
            var posts = [Post]()
            
            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? Post.init(fromDictionary: dict)
                else {
                    return
                }
                posts.append(decoder)
            }
            onSuccess(posts)
        }
    }
    
    static func loadAllPosts(postId: String, onSuccess: @escaping(_ posts: [Post]) -> Void) {
        
        PostService.PostsId(postId: postId).collection("allposts").getDocuments {
            (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            
            var allPosts = [Post]()
            
            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? Post.init(fromDictionary: dict)
                else {
                    return
                }
                allPosts.append(decoder)
            }
            onSuccess(allPosts)
        }
    }
}
