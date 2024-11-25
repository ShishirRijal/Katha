//
//  KathaApp.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    debugPrint("Firebase configuration successful!")

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    var authViewModel = AuthViewModel()
    WindowGroup {
      NavigationView {
        SplashScreenView()
          .environmentObject(authViewModel)
      }
    }
  }
}
