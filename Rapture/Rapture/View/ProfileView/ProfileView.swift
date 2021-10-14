//
//  ProfileView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(user: self.session.session)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
