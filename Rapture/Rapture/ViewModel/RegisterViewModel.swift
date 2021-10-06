//
//  RegisterViewModel.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/06.
//

import Foundation
import Firebase

class RegisterViewModel : ObservableObject {
    
    @Published var name = ""
    @Published var bio = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var profileImage_Data = Data(count: 0)
    @Published var picker = false
    
    func register() {
        
    }
    
}
