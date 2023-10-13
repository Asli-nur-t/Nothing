//
//  NothingApp.swift
//  Nothing
//
//  Created by Aslınur Topcu on 13.10.2023.
//

import SwiftUI
import Firebase

@main
struct NothingApp: App {
    
    init(){
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
