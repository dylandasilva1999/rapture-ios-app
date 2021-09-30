//
//  SignUpView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct SignUpView: View {
    
    @State var color = Color("Red")
    @State var email = ""
    @State var password = ""
    @State var retypePassword = ""
    @State var visible = false
    @State var retypeVisible = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color("Background")
                .ignoresSafeArea()
            
            GeometryReader {_ in
                VStack {
                    
                    HStack {
                        //Register button
                        Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text("back")
                                .font(Font.custom("Gilroy-Regular", size: 22))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                    
                    //Sign Up Logo
                    Image("Splash Logo")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240, alignment: .center)
                        .padding(.top, 40)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        //Sign Up boilerplate text
                        Text("Create your account.")
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
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    //Re-enter Password input field
                                    TextField("re-enter password", text: self.$retypePassword)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(.white)
                                        .foregroundColor(.white)
                                        .preferredColorScheme(.dark)
                                } else  {
                                    SecureField("re-enter password", text: self.$retypePassword)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(.white)
                                        .foregroundColor(.white)
                                        .preferredColorScheme(.dark)
                                }
                            }
                            
                            //Show re-enter password icon
                            Button (action: {
                                self.retypeVisible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white)
                            }
                                
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.retypePassword != "" ? Color("Red") : self.color, lineWidth: 4))
                        .padding(.top, 20)
                        
                        //Sign Up Button
                        Button(action: {
                            
                        }) {
                            Text("sign up")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
