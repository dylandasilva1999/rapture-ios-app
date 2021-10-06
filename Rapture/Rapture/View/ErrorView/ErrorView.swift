//
//  ErrorView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        GeometryReader {_ in
            VStack {
                HStack {
                    Text("Error")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
