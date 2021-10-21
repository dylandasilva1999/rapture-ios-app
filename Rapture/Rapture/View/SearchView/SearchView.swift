//
//  SearchView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    
    @State private var value: String = ""
    @State var users: [User] = []
    @State var isLoading = false
    
    func searchUsers() {
        isLoading = true
        
        SearchService.searchUser(input: value) {
            (users) in
            
            self.isLoading = false
            self.users = users
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SearchBar(value: $value)
                    .onChange(of: value, perform: {
                        new in
                        searchUsers()
                    })
                
                if !isLoading {
                    ForEach(users, id: \.uid) {
                        user in
                        
                        NavigationLink(destination: UserProfileView(user: user)) {
                            HStack {
                                WebImage(url: URL(string: user.profileImageUrl)!)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50, alignment: .trailing)
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading) {
                                    Text("\(user.username)")
                                        .font(Font.custom("Gilroy-Bold", size: 20))
                                        .foregroundColor(Color("White"))
                                    
                                    Text("\(user.email)")
                                        .font(Font.custom("Gilroy-Regular", size: 14))
                                        .foregroundColor(Color("White").opacity(0.6))
                                }
                            }
                            .padding(.top, 20)
                        }
                        
                        Divider()
                            .background(Color("Red"))
                            .padding(.top, 10)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 60)
        }.navigationTitle("")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
