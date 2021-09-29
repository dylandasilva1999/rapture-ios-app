//
//  FeedView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Text("Home View")
                    .foregroundColor(.white)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
