//
//  RegisterViewModel.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/06.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import SwiftUI
import simd

class RegisterViewModel : ObservableObject {
    
    @AppStorage("current_status") var status = false
    
    @Published var name = ""
    @Published var bio = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var profileImage_Data = Data(count: 0)
    @Published var picker = false
    @Published var isLoading = false
    
    let ref = Firestore.firestore()
    
    func register() {
        let uid = Auth.auth().currentUser!.uid
        
        UploadImage(imageData: profileImage_Data, path: "profile_Photos") { (url) in
            self.ref.collection("Users").document(uid).setData([
                "uid" : uid,
                "imageurl" : url,
                "name" : self.name,
                "bio" : self.bio,
                "email" : self.email,
                "dateCreated" : Date()
            ]) { (err) in
                if err != nil {
                    self.isLoading = false
                    return
                }
                self.isLoading = false
                self.status = true
            }
        }
    }
    
}
