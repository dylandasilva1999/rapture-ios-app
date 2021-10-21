//
//  SearchBar.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State var searchUsers = ""
    @State var isSearching = true
    
    var body: some View {
        HStack {
            TextField("Search users here", text: $searchUsers)
                .padding(.leading)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
