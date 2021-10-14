//
//  NewPostView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/10/13.
//

import SwiftUI

struct NewPostView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @State var postImage : Image?
    @State var pickedImage  : Image?
    @State var showingActionSheet : Bool = false
    @State var showingImagePicker : Bool = false
    @State var imageData: Data = Data()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var alert : Bool = false
    @State var error : String = ""
    @State var text = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Upload a post")
                        .font(Font.custom("Gilroy-Bold", size: 30))
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                    VStack {
                        if postImage != nil {
                            postImage!.resizable()
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width - 50, height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        } else {
                            Image(systemName: "photo.fill")
                                .font(.system(size: 45))
                                .foregroundColor(Color("White"))
                                .frame(width: UIScreen.main.bounds.width - 50, height: 250)
                                .background(Color("Red"))
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        }
                    }
                    
                    TextEditor(text: $text)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 150)
                        .foregroundColor(Color("White"))
                        .padding(5)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("Off Black")))
                    
                    Button(action: {
                        self.uploadPost()
                    }) {
                        Text("upload post")
                            .font(Font.custom("Gilroy-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical, 25)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Red"))
                    .cornerRadius(20)
                    .padding(.top, 40)
                    .shadow(color: Color("Red").opacity(0.4), radius: 15)
                    
                    Spacer()
                }
            }
            
            if self.alert {
                ErrorView(alert: $alert, error: $error)
            }
        }
        .frame(height: UIScreen.main.bounds.height - 180)
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
    
    //Upload Post
    func uploadPost() {
        if text.trimmingCharacters(in: .whitespaces).isEmpty && imageData.isEmpty {
            self.error = "Please add a caption and provide an image"
            self.alert.toggle()
        } else if text.trimmingCharacters(in: .whitespaces) == "" && imageData.isEmpty == false {
            self.error = "Please add a caption"
            self.alert.toggle()
        } else if text.trimmingCharacters(in: .whitespaces) != "" && imageData.isEmpty == true {
            self.error = "Please provide an image"
            self.alert.toggle()
        } else if text.trimmingCharacters(in: .whitespaces) != "" && imageData.isEmpty == false {
            //Firebase
            PostService.uploadPost(caption: text, imageData: imageData, onSuccess: {
                self.clear()
            }) {
                (errorMessage) in
                print ("Error \(errorMessage)")
                self.error = errorMessage
                self.alert.toggle()
                return
            }
        }
    }
    
    //Clear field inputs
    func clear() {
        self.text = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "photo.fill")
            .font(.system(size: 45))
            .foregroundColor(Color("White"))
            .frame(width: UIScreen.main.bounds.width - 50, height: 250)
            .background(Color("Red"))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .onTapGesture {
                self.showingActionSheet = true
            } as? Image
    }
    
    //Load Image
    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
        postImage = inputImage
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
