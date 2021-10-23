//
//  SignUpView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/30.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State var color = Color("Red")
    @State var username : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var profileImage : Image?
    @State var pickedImage  : Image?
    @State var showingActionSheet : Bool = false
    @State var showingImagePicker : Bool = false
    @State var imageData: Data = Data()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var retypePassword : String = ""
    @State var visible : Bool = false
    @State var retypeVisible : Bool = false
    @Binding var show: Bool
    @State var alert : Bool = false
    @State var error : String = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                
                Color("Background")
                    .ignoresSafeArea()
                
                GeometryReader {_ in
                    VStack {
                        HStack {
                            //Back button
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
                            if profileImage != nil {
                                profileImage!
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 240, height: 240)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        self.showingActionSheet = true
                                    }
                            } else {
                                Image(systemName: "person")
                                    .font(.system(size: 65))
                                    .foregroundColor(Color("White"))
                                    .frame(width: 240, height: 240)
                                    .background(Color("Red"))
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        self.showingActionSheet = true
                                    }
                            }
                        }
                        .padding(.top)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            //Sign Up boilerplate text
                            Text("Create your account.")
                                .font(Font.custom("Gilroy-Bold", size: 30))
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            
                            //Fullname input field
                            TextField("username", text: self.$username)
                                .font(Font.custom("Gilroy-Regular", size: 20))
                                .foregroundColor(.white)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(self.username != "" ? Color("Red") : self.color, lineWidth: 3))
                                .padding(.top, 00)
                                .preferredColorScheme(.dark)
                                .autocapitalization(.none)
                            
                            //Email input field
                            TextField("email", text: self.$email)
                                .font(Font.custom("Gilroy-Regular", size: 20))
                                .foregroundColor(.white)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(self.email != "" ? Color("Red") : self.color, lineWidth: 3))
                                .padding(.top, 20)
                                .preferredColorScheme(.dark)
                                .autocapitalization(.none)
                            
                            HStack(spacing: 15) {
                                VStack {
                                    if self.visible {
                                        //Password input field
                                        TextField("password", text: self.$password)
                                            .font(Font.custom("Gilroy-Regular", size: 20))
                                            .foregroundColor(.white)
                                            .foregroundColor(.white)
                                            .preferredColorScheme(.dark)
                                            .autocapitalization(.none)
                                    } else  {
                                        SecureField("password", text: self.$password)
                                            .font(Font.custom("Gilroy-Regular", size: 20))
                                            .foregroundColor(.white)
                                            .foregroundColor(.white)
                                            .preferredColorScheme(.dark)
                                            .autocapitalization(.none)
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
                            
                            Button(action: {
                                self.signUp()
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
                            //                        }
                        }
                        .padding(.top, 30)
                    }
                    .padding(.horizontal, 30)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if self.alert {
                ErrorView(alert: $alert, error: $error)
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text(""), buttons: [.default(Text("Choose an image")) {
                self.sourceType = .photoLibrary
                self.showingImagePicker = true
            }, .default(Text("Take a photo")) {
                self.sourceType = .camera
                self.showingImagePicker = true
            }, .cancel()])
        }
    }
    
    func clear() {
        self.email = ""
        self.username = ""
        self.password = ""
        self.imageData = Data()
    }
    
    func signUp() {
        if self.email != "" && self.password != "" && self.username != "" && self.profileImage != nil {
            AuthService.signUp(username: username, email: email, password: password, imageData: imageData, onSuccess: { (user) in
                self.clear()
            }) { (errorMessage) in
                self.error = errorMessage
                self.alert.toggle()
                return
            }
        } else if self.email == "" && self.password != "" && self.username == "" {
            self.error = "Please fill in your email and username."
            self.alert.toggle()
        } else if self.email != "" && self.password != "" && self.username == "" {
            self.error = "Please fill in your username."
            self.alert.toggle()
        } else if self.email == "" && self.password == "" && self.username != "" {
            self.error = "Please fill in your email and your password."
            self.alert.toggle()
        } else if self.email != "" && self.password == "" && self.username == "" {
            self.error = "Please fill in your username and your password."
            self.alert.toggle()
        } else if self.email != "" && self.password == "" && self.username != "" {
            self.error = "Please enter your password."
            self.alert.toggle()
        } else {
            self.error = "Please fill in all your information."
            self.alert.toggle()
        }
    }
    
    //Load Image
    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
        
        profileImage = inputImage
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignUpView(show: $show)
    }
}
