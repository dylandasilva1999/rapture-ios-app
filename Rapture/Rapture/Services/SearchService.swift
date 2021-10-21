//
//  SearchService.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import Foundation
import FirebaseAuth

class SearchService {
    
    static func searchUser(input: String, onSuccess: @escaping (_ user: [User]) -> Void) {
        
        AuthService.storeRoot.collection("users").whereField("searchName", arrayContains: input.lowercased().removeWhiteSpace()).getDocuments {
            (querysnapshot, err) in
            
            guard let snap = querysnapshot else {
                print("error")
                return
            }
            
            var users = [User]()
            
            for document in snap.documents {
                let dict = document.data()
                
                guard let decoded = try? User.init(fromDictionary: dict)
                    else {return}
                
                if decoded.uid != Auth.auth().currentUser!.uid {
                    users.append(decoded)
                }
                
                onSuccess(users)
            }
        }
    }
}
