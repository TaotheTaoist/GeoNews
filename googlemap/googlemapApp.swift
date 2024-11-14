//
//  googlemapApp.swift
//  googlemap
//
//  Created by ABC on 11/11/24.
//


//
//@main
//struct googlemapApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
import SwiftUI
import Firebase

@main
struct googlemapApp: App {
    // Initialize Firebase when the app starts
    init() {
        FirebaseApp.configure()
        
        // Test connection by accessing Firebase services
        checkFirebaseConnection()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func checkFirebaseConnection() {
        // Attempt a simple Firestore read operation to confirm connection
        let db = Firestore.firestore()
        
        db.collection("test").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error connecting to Firebase: \(error.localizedDescription)")
            } else if let documents = querySnapshot?.documents, !documents.isEmpty {
                print("Successfully connected to Firebase and found documents.")
            } else {
                print("Successfully connected to Firebase, but no documents found.")
            }
        }
    }
}
