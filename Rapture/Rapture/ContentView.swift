//
//  ContentView.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPageIndex") var currentPageIndex = 1
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            if(currentPageIndex > 2) {
                SignInView()
            } else {
                OnboardingView(screenSize: size)
                    .background(Color("Background"))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
