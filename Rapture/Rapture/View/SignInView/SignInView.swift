//
//  SignInView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    
    @State var color = Color("Red")
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
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
                            self.show.toggle()
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
                        .padding(.top, 60)
                    
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
                                self.resetPassword()
                            }) {
                                Text("forget password")
                                    .font(Font.custom("Gilroy-Regular", size: 22))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top, 20)
                        
                        //Sign In Button
                        Button(action: {
                            self.verify()
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
        
        if self.alert {
            ErrorView(alert: self.$alert, error: self.$error)
        }
    }
    
    func verify() {
            if self.email != "" && self.password != "" {
                Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else if self.email == "" && self.password != "" {
                self.error = "Please fill in your email."
                self.alert.toggle()
            } else if self.password == "" && self.email != "" {
                self.error = "Please fill in your password."
                self.alert.toggle()
            } else {
                self.error = "Please fill in all your information."
                self.alert.toggle()
            }
    }
    
    func resetPassword() {
            if self.email != "" {
                Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    self.error = "RESET"
                    self.alert.toggle()
                }
            } else {
                self.error = "Your email field is empty."
                self.alert.toggle()
            }
    }
}

struct SignInView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignInView(show: $show)
    }
}
