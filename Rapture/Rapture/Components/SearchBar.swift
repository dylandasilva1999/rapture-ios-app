//
//  SearchBar.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var value: String
    @State var isSearching = false
    
    var body: some View {
        HStack {
            TextField("", text: $value)
                .placeholder(when: value.isEmpty) {
                    Text("search for a person")
                        .foregroundColor(Color("White"))
                }
                .padding(28)
                .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color("Red"), style: StrokeStyle(lineWidth: 3.0)))
                .foregroundColor(Color("White"))
        }
        .cornerRadius(20)
        .onTapGesture(perform: {
            isSearching = true
        })
        .overlay(
            HStack {
                Spacer()
                
                Button(action: {value = ""}) {
                    Image(systemName: "xmark.circle.fill")
                }
                
            }
            .padding(.horizontal, 30)
            .foregroundColor(Color("White"))
        )
    }
}

//Custom Placeholder Colour Extension
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
