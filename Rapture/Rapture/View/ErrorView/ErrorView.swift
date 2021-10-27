//
//  ErrorView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error: String
    
    var body: some View {
        GeometryReader{_ in
            VStack {
                HStack {
                    Text(self.error == "RESET" ? "Message" : "Oops...")
                        .font(Font.custom("Gilroy-Bold", size: 25))
                        .foregroundColor(Color("White"))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
                
                HStack {
                    Text(self.error == "RESET" ? "A password reset link has been sent to your inbox" : self.error)
                        .font(Font.custom("Gilroy-Regular", size: 20))
                        .foregroundColor(Color("White"))
                        .multilineTextAlignment(.leading)
                        
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal, 30)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text(self.error == "RESET" ? "Ok" : "close window")
                        .font(Font.custom("Gilroy-Regular", size: 25))
                        .foregroundColor(Color("White"))
                        .padding(.vertical, 22)
                        .frame(width: UIScreen.main.bounds.width - 115)
                }
                .background(Color("Red"))
                .cornerRadius(20)
                .padding(.top, 20)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color("Background"))
            .cornerRadius(20)
            .position(x: UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/2.2)
        }
        .background(Color.black.opacity(0.85).edgesIgnoringSafeArea(.all))
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    
    @State static private var alert = true
    @State static private var error = ""
    
    static var previews: some View {
        ErrorView(alert: $alert, error: $error)
    }
}
