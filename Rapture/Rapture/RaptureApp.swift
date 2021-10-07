//
//  RaptureApp.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/22.
//

import SwiftUI
import Firebase

@main
struct RaptureApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}

//App Delegate Class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Firebase Initialised...")
        FirebaseApp.configure()
        return true
    }
}
