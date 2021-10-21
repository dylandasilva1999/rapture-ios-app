//
//  FollowService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import Foundation
import Firebase

class FollowService: ObservableObject {
    
    func updateFollowCount(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followersCount: Int) -> Void) {
        
        ProfileService.followingCollection(userId: userId).getDocuments {
            (snapshot, error) in
            
            if let doc = snapshot?.documents {
                followingCount(doc.count)
            }
        }
        
        ProfileService.followersCollection(userId: userId).getDocuments {
            (snapshot, error) in
            
            if let doc = snapshot?.documents {
                followersCount(doc.count)
            }
        }
    }
    
    func manageFollow(userId: String, followCheck: Bool, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followingCount: Int) -> Void) {
        
        if !followCheck {
            follow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        } else {
            unfollow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
    }
    
    func follow(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followingCount: Int) -> Void) {
        
        ProfileService.followingId(userId: userId).setData([:]) {
            (error) in
            
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
        
        ProfileService.followersId(userId: userId).setData([:]) {
            (error) in
            
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
    }
    
    func unfollow(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followingCount: Int) -> Void) {
        
        ProfileService.followingId(userId: userId).getDocument {
            (document, error) in
            
            if let doc = document, doc.exists {
                doc.reference.delete()
                
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
        
        ProfileService.followersId(userId: userId).getDocument {
            (document, error) in
            
            if let doc = document, doc.exists {
                doc.reference.delete()
                
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
    }
}
