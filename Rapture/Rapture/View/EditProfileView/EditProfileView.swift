//
//  EditProfileView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/21.
//

import SwiftUI
import FirebaseAuth
import Firebase
import SDWebImageSwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @State var username : String = ""
    @State var profileImage : Image?
    @State var pickedImage  : Image?
    @State var showingActionSheet : Bool = false
    @State var showingImagePicker : Bool = false
    @State var imageData: Data = Data()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var alert : Bool = false
    @State var error : String = ""
    @State var bio : String = ""
    @State var color = Color("Red")
    
    init(session: User?) {
        _bio = State(initialValue: session?.bio ?? "")
        _username = State(initialValue: session?.username ?? "")
    }
    
    func loadImage() {
        guard let inputImage = pickedImage else {return}
        
        profileImage = inputImage
    }
    
    func clear() {
        self.bio = ""
        self.username = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person")
            .font(.system(size: 65))
            .foregroundColor(Color("White"))
            .frame(width: 240, height: 240)
            .background(Color("Red"))
            .clipShape(Circle())
            .onTapGesture {
                self.showingActionSheet = true
            } as? Image
    }
    
    func updateProfile() {
        
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        let storageProfileUserId = StorageService.storageProfileId(userId: userId)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        if self.username != "" && self.bio != "" && self.profileImage != nil {
            StorageService.editProfile(userId: userId, username: username, bio: bio, imageData: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onError: {
                (errorMessage) in
                
                self.error = errorMessage
                self.alert.toggle()
                return
            })
            
            self.clear()
        } else if self.username == "" && self.bio == "" && self.profileImage == nil {
            self.error = "Please fill in all your info."
            self.alert.toggle()
        } else if self.username == "" && self.bio == "" && self.profileImage != nil {
            self.error = "Please fill in your username and bio."
            self.alert.toggle()
        } else if self.username != "" && self.bio != "" && self.profileImage == nil {
            self.error = "Please choose a profile picture."
            self.alert.toggle()
        } else if self.username != "" && self.bio == "" && self.profileImage != nil {
            self.error = "Please enter your bio."
            self.alert.toggle()
        } else if self.username == "" && self.bio != "" && self.profileImage != nil {
            self.error = "Please enter your username."
            self.alert.toggle()
        }
        
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    
                    //Update Profile boilerplate text
                    Text("Update your profile")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(.white)
                    
                    //Profile Image
                    VStack {
                        Group {
                            if profileImage != nil {
                                profileImage!
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 220, height: 220)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        self.showingActionSheet = true
                                    }
                            } else {
                                if profileImage == nil {
                                    WebImage(url: URL(string: session.session!.profileImageUrl)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 220, height: 220)
                                        .padding()
                                        .onTapGesture {
                                            self.showingActionSheet = true
                                        }
                                }
                            }
                        }
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        //Username input field
                        FormField(value: $username, icon: "person.fill", placeholder: "username")
                        
                        //Bio input field
                        FormField(value: $bio, icon: "person.fill", placeholder: "enter your bio")
                        
                        Button(action: {
                            self.updateProfile()
                        }) {
                            Text("update profile")
                                .font(Font.custom("Gilroy-SemiBold", size: 22))
                                .foregroundColor(.white)
                                .padding(.vertical, 25)
                                .frame(width: UIScreen.main.bounds.width - 60)
                        }
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(.top, 40)
                        .shadow(color: Color("Red").opacity(0.4), radius: 15)
                        
                        Text("Changes will be effected on next sign in.")
                            .font(Font.custom("Gilroy-Regular", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 25)
                            .frame(width: UIScreen.main.bounds.width - 60)
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 30)
            }
            .navigationTitle("")
            
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
}
