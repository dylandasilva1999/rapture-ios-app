//
//  FeedView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                //Say out loud button
                Button(action: {
                    session.logout()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }) {
                    Text("sign out of account")
                        .font(Font.custom("Gilroy-Regular", size: 25))
                        .foregroundColor(Color("White"))
                        .padding(.vertical, 25)
                }
                .frame(width: UIScreen.main.bounds.width - 80)
                .background(Color("Red"))
                .cornerRadius(20)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
