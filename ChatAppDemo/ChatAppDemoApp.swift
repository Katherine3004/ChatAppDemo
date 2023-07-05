//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Katherine Chambers on 2023/06/30.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
