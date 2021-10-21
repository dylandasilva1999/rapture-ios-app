//
//  FollowButton.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI

struct FollowButton: View {
    
    @ObservedObject var followService = FollowService()
    
    var user: User
    @Binding var followingCount: Int
    @Binding var followersCount: Int
    @Binding var followCheck: Bool
    
    init(user: User, followCheck: Binding<Bool>, followingCount: Binding<Int>, followersCount: Binding<Int>) {
        self.user = user
        self._followCheck = followCheck
        self._followingCount = followingCount
        self._followersCount = followersCount
    }
    
    func follow() {
        if !self.followCheck {
            followService.follow(userId: user.uid, followingCount: {
                (followingCount) in
                
                self.followingCount = followingCount
            }) {
                (followersCount) in
                
                self.followersCount = followersCount
            }
            self.followCheck = true
            
        } else {
            followService.unfollow(userId: user.uid, followingCount: {
                (followingCount) in
                
                self.followingCount = followingCount
            }) {
                (followersCount) in
                
                self.followersCount = followersCount
            }
            self.followCheck = true
        }
    }
    
    var body: some View {
        Button(action: {
            self.follow()
        }) {
            Text((self.followCheck) ? "unfollow" : "follow")
                .font(Font.custom("Gilroy-SemiBold", size: 22))
                .foregroundColor(.white)
                .padding(.vertical, 25)
                .frame(width: UIScreen.main.bounds.width - 50)
        }
        .background(Color("Red"))
        .cornerRadius(20)
        .padding(.top, 40)
        .shadow(color: Color("Red").opacity(0.4), radius: 15)
    }
}
