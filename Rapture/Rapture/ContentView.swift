//
//  ContentView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPageIndex") var currentPageIndex = 1
    @State var show = false
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                if(currentPageIndex > 2) {
                    NavigationView {
                        ZStack {
                            NavigationLink(destination: SignUpView(show: self.$show), isActive: self.$show) {
                                Text("")
                            }
                            .hidden()
                            
                            SignInView(show: self.$show)
                        }
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    }
                } else {
                    OnboardingView(screenSize: size)
                        .background(Color("Background"))
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
