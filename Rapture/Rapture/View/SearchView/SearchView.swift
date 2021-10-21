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
    @State var isLoading = true
    @ObservedObject var mainService = MainService()
    
    var columns = [GridItem(.flexible(minimum: 60), spacing: 0),
                   GridItem(.flexible(minimum: 60), spacing: 0)]
    
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
            
            VStack(alignment: .leading) {
                if isLoading {
                    
                    Text("Explore the community!")
                        .font(Font.custom("Gilroy-Bold", size: 20))
                        .foregroundColor(Color("White"))
                    
                    Divider()
                        .background(Color("Red"))
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                        ForEach(self.mainService.allPosts, id: \.postId) {
                            (allPosts) in

                            WebImage(url: URL(string: allPosts.mediaUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/4)
                                .padding(.bottom, 2)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .padding(.top, 20)
        }
        .navigationTitle("")
        .onAppear {
            self.mainService.loadAllPosts()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
