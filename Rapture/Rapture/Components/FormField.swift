//
//  FormField.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/23.
//

import SwiftUI

struct FormField: View {
    
    @Binding var value: String
    @State var color = Color("Red")
    var icon: String
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        Group {
            HStack {
                if isSecure {
                    TextField(placeholder, text: $value)
                        .font(Font.custom("Gilroy-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding(20)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.value != "" ? Color("Red") : self.color, lineWidth: 3))
                        .padding(.top, 10)
                        .preferredColorScheme(.dark)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholder, text: $value)
                        .font(Font.custom("Gilroy-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding(20)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.value != "" ? Color("Red") : self.color, lineWidth: 3))
                        .padding(.top, 10)
                        .preferredColorScheme(.dark)
                        .autocapitalization(.none)
                }
            }
        }
    }
}
