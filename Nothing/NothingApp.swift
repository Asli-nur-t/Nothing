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
    
    @StateObject var dataManager = DataManager()
    init(){
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
