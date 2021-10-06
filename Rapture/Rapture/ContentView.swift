//
//  ContentView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPageIndex") var currentPageIndex = 1
    @AppStorage("current_status") var status = false
    @State var show = false
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                if(currentPageIndex > 2) {
                    NavigationView {
                        VStack {
                            if self.status {
                                HomeView()
                            } else {
                                ZStack {
                                    NavigationLink(destination: SignUpView(show: self.$show), isActive: self.$show) {
                                        Text("")
                                    }
                                    .hidden()
                                    
                                    SignInView(show: self.$show)
                                }
                            }
                        }
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .onAppear {
                            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                            }
                        }
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
