//
//  SignUpView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var registerData = RegisterViewModel()
    
    @State var color = Color("Red")
    @State var visible = false
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color("Background")
                .ignoresSafeArea()
            
            GeometryReader {_ in
                VStack {
                    
                    HStack {
                        //Register button
                        Button(action: {
                            self.show.toggle()
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
                    
                    //Profile Image
                    ZStack {
                        
                        if registerData.profileImage_Data.count == 0 {
                            Image(systemName: "person")
                                .font(.system(size: 65))
                                .foregroundColor(Color("White"))
                                .frame(width: 240, height: 240)
                                .background(Color("Red"))
                                .clipShape(Circle())
                        } else {
                            Image(uiImage: UIImage(data: registerData.profileImage_Data)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 240, height: 240)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top)
                    .onTapGesture (perform: {
                        registerData.picker.toggle()
                    })
                    
                    VStack(alignment: .leading, spacing: 6) {
                        //Email input field
                        TextField("fullname", text: self.$registerData.name)
                            .font(Font.custom("Gilroy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(self.registerData.name != "" ? Color("Red") : self.color, lineWidth: 4))
                            .padding(.top, 00)
                            .preferredColorScheme(.dark)
                        
                        //Email input field
                        TextField("bio", text: self.$registerData.bio)
                            .font(Font.custom("Gilroy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(self.registerData.bio != "" ? Color("Red") : self.color, lineWidth: 4))
                            .padding(.top, 20)
                            .preferredColorScheme(.dark)
                        
                        //Email input field
                        TextField("email", text: self.$registerData.email)
                            .font(Font.custom("Gilroy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(self.registerData.email != "" ? Color("Red") : self.color, lineWidth: 4))
                            .padding(.top, 20)
                            .preferredColorScheme(.dark)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    //Password input field
                                    TextField("password", text: self.$registerData.password)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(.white)
                                        .foregroundColor(.white)
                                        .preferredColorScheme(.dark)
                                } else  {
                                    SecureField("password", text: self.$registerData.password)
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
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.registerData.password != "" ? Color("Red") : self.color, lineWidth: 4))
                        .padding(.top, 20)
                        
                        //Sign Up Button
                        Button(action: {
                            registerData.register()
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
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $registerData.picker, content: {
            ImagePicker(picker: $registerData.picker, img_Data: $registerData.profileImage_Data)
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignUpView(show: $show)
    }
}
