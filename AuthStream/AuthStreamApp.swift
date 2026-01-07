//
//  AuthStreamApp.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 21/12/25.
//

import SwiftUI
import Firebase
import SwiftData

@main
struct AuthStreamApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // Adapts a UIKit Appdelegate for use in SwiftUI, Connects SwiftUI’s lifecycle with UIKit’s delegate system
    // Connects SwiftUI’s lifecycle with UIKit’s delegate system
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .modelContainer(for: PasswordItem.self)
        }
    }
}

// Act as a LifeCycle manager for the aap
class AppDelegate: NSObject, UIApplicationDelegate {
    // this function is called when once when the aap launches
    // It is the earliest safe point to configure global services
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        // Initializes Firebase ,Loads project credentials, Enables all Firebase services for the app
        return true // Signals that the app launched successfully
    }
}
