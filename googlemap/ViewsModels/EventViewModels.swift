import SwiftUI
import Firebase
import FirebaseFirestore
import CoreLocation
import MapKit

//
//class EventViewModel: ObservableObject {
//    @Published var events: [Event] = []  // Store events data
//    @Published var isLoading = false      // Track loading state
//    @Published var errorMessage: String? = nil  // Error message
//    
//    private var db = Firestore.firestore()
//    
//    // Method to fetch events from Firebase
//    func fetchEvents(eventType: String) {
//        self.isLoading = true
//        print("Fetching events for event type: \(eventType)")
//        // Asynchronously fetch documents from Firestore
//        db.collection(eventType).getDocuments { (querySnapshot, error) in
//            self.isLoading = false
//            print("Fetch completed for event type: \(eventType)")  // Print to track completion
//                        
//            if let error = error {
//                self.errorMessage = "Error fetching events: \(error.localizedDescription)"
//                print(self.errorMessage ?? "")
//                return
//            }
//            
//            guard let querySnapshot = querySnapshot else {
//                self.errorMessage = "No data found."
//                print(self.errorMessage ?? "")
//                return
//            }
//            print("Number of documents fetched: \(querySnapshot.documents.count)")
//                       
//            // Parse documents into Event objects
//            self.events = querySnapshot.documents.compactMap { document in
//                // Decoding Event objects from Firestore document data
//                try? document.data(as: Event.self)
//            }
//        }
//    }
//    
//    // Helper method to fetch events from Firebase
//    func fetchEventsForMap(eventType: String, completion: @escaping ([Event]) -> Void) {
//        self.isLoading = true
//        
//        db.collection(eventType).getDocuments { (querySnapshot, error) in
//            self.isLoading = false
//            
//            if let error = error {
//                self.errorMessage = "Error fetching events: \(error.localizedDescription)"
//                print(self.errorMessage ?? "")
//                return
//            }
//            
//            guard let querySnapshot = querySnapshot else {
//                self.errorMessage = "No data found."
//                print(self.errorMessage ?? "")
//                return
//            }
//            
//            // Parse documents into Event objects and return via completion handler
//            let events = querySnapshot.documents.compactMap { document in
//                try? document.data(as: Event.self)
//            }
//            completion(events)  // Pass the events to the MapView
//        }
//    }
//}


class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var coordinates: [CLLocationCoordinate2D] = []
    private var db = Firestore.firestore()
    
//    func fetch

    func fetchEventsForMap(completion: @escaping ([Event]) -> Void) {
        // Fetch all documents under the "Night Market" collection
        db.collection("Night Market") // Your collection name
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching events: \(error.localizedDescription)")
                    completion([])
                    return
                }

                guard let querySnapshot = querySnapshot else {
                    completion([])
                    return
                }

                // Print the number of documents fetched
                print("Documents fetched: \(querySnapshot.documents.count)")

                // Loop through the documents and print each one
                for document in querySnapshot.documents {
                    // Print the Document ID
                    print("Document ID: \(document.documentID)")
                    
                    // Print the document's data as a dictionary
                    print("Document Data: \(document.data())")
                }

                // Map Firestore documents to Event model
                let events = querySnapshot.documents.compactMap { document in
                    let data = document.data()

                    // Assuming latitude and longitude are available
                    if let latitude = data["latitude"] as? Double, let longitude = data["longitude"] as? Double {
                        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                        
                        return Event(
                            happenedAt: data["happenedAt"] as? Date ?? Date(),
                            lastingTime: data["lastingTime"] as? TimeInterval ?? 0,
                            location: location,
                            dangerousLevel: data["dangerousLevel"] as? Int ?? 0,
                            funLevel: data["funLevel"] as? Int ?? 0,
                            temp: data["temp"] as? Double ?? 0,
                            radius: data["radius"] as? Double ?? 0,
                            url: data["url"] as? String ?? "",
                            type: data["name"] as? String ?? ""
                        )
                    }
                    return nil
                }

                // Update the events array with fetched data
                DispatchQueue.main.async {
                    self.events = events
                    completion(events) // Call the completion handler with the fetched events
                }
            }
    }
    func fetchEventCoordinates(completion: @escaping ([(coordinate: CLLocationCoordinate2D, id: String)]) -> Void) {
        // Fetch all documents under the "Night Market" collection
        db.collection("Night Market") // Your collection name
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching event coordinates: \(error.localizedDescription)")
                    completion([])
                    return
                }

                guard let querySnapshot = querySnapshot else {
                    completion([])
                    return
                }

                // Print the number of documents fetched
                print("Documents fetched: \(querySnapshot.documents.count)")

                // Extract coordinates from each document and include the document ID
                let coordinatesWithId = querySnapshot.documents.compactMap { document -> (CLLocationCoordinate2D, String)? in
                    let data = document.data()

                    // Parse location (latitude and longitude)
                    if let locationData = data["location"] as? [String: Any],
                       let latitude = locationData["latitude"] as? Double,
                       let longitude = locationData["longitude"] as? Double {
                        // Return the coordinates with the document's unique ID
                        return (CLLocationCoordinate2D(latitude: latitude, longitude: longitude), document.documentID)
                    }
                    return nil
                }

                // Return the list of coordinates with their respective document IDs
                DispatchQueue.main.async {
                    completion(coordinatesWithId)
                }
            }
    }

//    func fetchEventCoordinates(completion: @escaping ([CLLocationCoordinate2D]) -> Void) {
//        // Fetch all documents under the "Night Market" collection
//        db.collection("Night Market") // Your collection name
//            .getDocuments { (querySnapshot, error) in
//                if let error = error {
//                    print("Error fetching event coordinates: \(error.localizedDescription)")
//                    completion([])
//                    return
//                }
//
//                guard let querySnapshot = querySnapshot else {
//                    completion([])
//                    return
//                }
//
//                // Print the number of documents fetched
//                print("Documents fetched: \(querySnapshot.documents.count)")
//
//                // Extract coordinates from each document
//                let coordinates = querySnapshot.documents.compactMap { document in
//                    let data = document.data()
//
//                    // Parse location (latitude and longitude)
//                    if let locationData = data["location"] as? [String: Any],
//                       let latitude = locationData["latitude"] as? Double,
//                       let longitude = locationData["longitude"] as? Double {
//                        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//                    }
//                    return nil
//                }
//
//                // Return the list of coordinates
//                DispatchQueue.main.async {
//                    completion(coordinates)
//                }
//            }
//    }

}
