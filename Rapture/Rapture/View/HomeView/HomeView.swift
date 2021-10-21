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
        VStack {
            CustomTabView()
        }
    }
}

var tabs = ["pentagon.fill", "magnifyingglass", "plus", "person.fill"]

struct CustomTabView: View {
    @State var selectedTab = "pentagon.fill"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                MainView()
                    .tag("pentagon.fill")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.2)
                SearchView()
                    .tag("magnifyingglass")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.2)
                NewPostView()
                    .tag("plus")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.2)
                ProfileView()
                    .tag("person.fill")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) {
                    image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
            .padding(.horizontal)
            .background(Color("Off Black"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: UIScreen.main.bounds.width - 55)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color("Background").ignoresSafeArea(.all, edges: .all))
    }
}

struct TabButton: View {
    var image: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color("Red") : Color("White"))
                .font(.title2)
                .padding()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
