//
//  UploadImage.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/06.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseAuth
import simd

func UploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()) {
    
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        if err != nil {
            completion("")
            return
        }
        
        //Downloading Url and Sending Back
        storage.child(path).child(uid).downloadURL { (url, err) in
            if err != nil {
                completion("")
                return
            }
        }
    }
    
}
