//
//  BeSpokeApp.swift
//  BeSpoke
//
//  Created by Ethan Wright on 2022-10-30.
//

import FirebaseCore
import GoogleSignIn
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool
    {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct BeSpokeApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var authManager: AuthManager

    init() {
        FirebaseApp.configure()

        let authManager = AuthManager()
        _authManager = StateObject(wrappedValue: authManager)
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(authManager)
            }
        }
    }
}
