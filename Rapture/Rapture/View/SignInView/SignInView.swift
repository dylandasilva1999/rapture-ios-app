//
//  SignInView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct SignInView: View {
    
    @State var color = Color("Red")
    @State var email = ""
    @State var password = ""
    @State var visible = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color("Background")
                .ignoresSafeArea()
            
            GeometryReader {_ in
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        //Register button
                        Button(action: {
                            
                        }) {
                            Text("register")
                                .font(Font.custom("Gilroy-SemiBold", size: 22))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 20)
                    }
                    
                    //Sign In Logo
                    Image("Splash Logo")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240, alignment: .center)
                        .padding(.top, 50)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        //Sign welcome text
                        Text("welcome gamer!")
                            .font(Font.custom("Gilroy-Regular", size: 22))
                            .foregroundColor(.white)
                        //Sign In boilerplate text
                        Text("Sign in to your account.")
                            .font(Font.custom("Gilroy-Bold", size: 30))
                            .foregroundColor(.white)
                        
                        //Email input field
                        TextField("email", text: self.$email)
                            .font(Font.custom("Gilroy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(self.email != "" ? Color("Red") : self.color, lineWidth: 4))
                            .padding(.top, 30)
                            .preferredColorScheme(.dark)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    //Password input field
                                    TextField("password", text: self.$password)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(.white)
                                        .foregroundColor(.white)
                                        .preferredColorScheme(.dark)
                                } else  {
                                    SecureField("password", text: self.$password)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(.white)
                                        .foregroundColor(.white)
                                        .preferredColorScheme(.dark)
                                }
                            }
                            
                            //Show password icon
                            Button (action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white)
                            }
                                
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.password != "" ? Color("Red") : self.color, lineWidth: 4))
                        .padding(.top, 20)
                        
                        //Forget password text
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Text("forget password")
                                    .font(Font.custom("Gilroy-Regular", size: 22))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top, 20)
                        
                        //Sign In Button
                        Button(action: {
                            
                        }) {
                            Text("sign in")
                                .font(Font.custom("Gilroy-SemiBold", size: 22))
                                .foregroundColor(.white)
                                .padding(.vertical, 25)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(.top, 40)
                        .shadow(color: Color("Red").opacity(0.4), radius: 15)
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
