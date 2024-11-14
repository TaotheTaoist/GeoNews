//import SwiftUI
//import CoreLocation
//import Firebase
//import FirebaseFirestore
//
//
//
//// EventType struct to hold event types for selection
//struct EventType {
//    let name: String
//    let type: String  // This can be used to determine the form for the event
//}
//
//struct EventSelectionView: View {
//    @Binding var selectedEventType: String?
//  
//
//    let eventTypes: [EventType] = [
//        EventType(name: "Night Market", type: "Night Market"),
//        EventType(name: "Earthquake", type: "Earthquake"),
//        EventType(name: "Party", type: "Party"),
//        // Add more event types as needed
//    ]
//    
//    var body: some View {
//        NavigationView {
//            List(eventTypes, id: \.name) { eventType in
//                Button(action: {
//                    selectedEventType = eventType.type
//                }) {
//                    HStack {
//                        Text(eventType.name)
//                            .font(.headline)
//                        Spacer()
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarTitle("Select Event Type")
//        }
//    }
//}
//
//
//// Sample forms for different event types
//struct NightMarketEventEditView: View {
//    
//    @State private var name: String = ""
//    @State private var foodSpecialties: [String] = []
//    @State private var rating: Double? = nil
//    @State private var isFamilyFriendly: Bool = true
//    @State private var stallCount: Int = 0
//    @State private var address: String = ""
//    @State private var startTime: Date = Date()
//    @State private var endTime: Date = Date()
//    @State private var isIndoor: Bool = true
//    @State private var safetyMeasures: String = ""
//    @State private var eventImageURL: String? = nil
//    @State private var ticketPriceRange: String? = nil
//    @State private var isFree: Bool = false
//    @State private var parkingAvailable: Bool = true
//    @State private var isSoldOut: Bool = false
//    @State private var remainingTickets: Int = 100
//    
//    var body: some View {
//        Form {
//            TextField("Event Name", text: $name)
//          
//            TextField("Address", text: $address)
//            DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
//            DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
//            Toggle("Family Friendly", isOn: $isFamilyFriendly)
//            Toggle("Indoor", isOn: $isIndoor)
//            Toggle("Free", isOn: $isFree)
//            Toggle("Parking Available", isOn: $parkingAvailable)
//            
//            Button("Save") {
//                saveEventToFirebase()
//            }
//        }
//        .navigationBarTitle("Edit Night Market Event")
//    }
//    private func saveEventToFirebase() {
//           let db = Firestore.firestore()
//           
//           // Prepare the event data as a dictionary
//           let eventData: [String: Any] = [
//               "name": name,
//               "foodSpecialties": foodSpecialties,
//               "rating": rating ?? 0.0,
//               "isFamilyFriendly": isFamilyFriendly,
//               "stallCount": stallCount,
//               "address": address,
//               "startTime": Timestamp(date: startTime),
//               "endTime": Timestamp(date: endTime),
//               "isIndoor": isIndoor,
//               "safetyMeasures": safetyMeasures,
//               "eventImageURL": eventImageURL ?? "",
//               "ticketPriceRange": ticketPriceRange ?? "",
//               "isFree": isFree,
//               "parkingAvailable": parkingAvailable,
//               "isSoldOut": isSoldOut,
//               "remainingTickets": remainingTickets
//           ]
//           
//           // Save data to Firestore in the "events" collection
//           db.collection("events").addDocument(data: eventData) { error in
//               if let error = error {
//                   print("Error saving event: \(error.localizedDescription)")
//               } else {
//                   print("Event saved successfully!")
//               }
//           }
//       }
//}
import SwiftUI
import CoreLocation
import Firebase
import FirebaseFirestore

// EventType struct to hold event types for selection
struct EventType {
    let name: String
    let type: String  // This can be used to determine the form for the event
}

struct EventSelectionView: View {
    @Binding var selectedEventType: String?
    let eventTypes: [EventType] = [
        EventType(name: "Night Market", type: "Night Market"),
        EventType(name: "Earthquake", type: "Earthquake"),
        EventType(name: "Party", type: "Party"),
        // Add more event types as needed
    ]
    
    var body: some View {
        NavigationView {
            List(eventTypes, id: \.name) { eventType in
                Button(action: {
                    selectedEventType = eventType.type
                }) {
                    HStack {
                        Text(eventType.name)
                            .font(.headline)
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationBarTitle("選擇事件")
        }
    }
}

// NightMarketEventEditView with inherited fields from Event
struct NightMarketEventEditView: View {
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 6 // You can set this based on your precision needs
        formatter.maximumFractionDigits = 6
        return formatter
    }()
    
    // Night Market-specific properties
    @State private var name: String = ""
    @State private var foodSpecialties: [String] = []
    @State private var rating: Double? = nil
    @State private var isFamilyFriendly: Bool = true
    @State private var stallCount: Int = 0
    
    // Event superclass properties
    @State private var happenedAt: Date = Date()
    @State private var lastingTime: TimeInterval = 0
    @Binding var location: CLLocationCoordinate2D
    @State private var dangerousLevel: Int = 1
    @State private var funLevel: Int = 0
    @State private var temp: Double = 0.0
    @State private var radius: Double = 0.0
    @State private var url: String = ""
    
    // Additional NightMarketEvent properties
    
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var isIndoor: Bool = true
    @State private var safetyMeasures: String = ""
    @State private var eventImageURL: String? = nil
    @State private var ticketPriceRange: String? = nil
    @State private var isFree: Bool = false
    @State private var parkingAvailable: Bool = true
    @State private var isSoldOut: Bool = false
   
    @Binding var selectedEventType: String? 
    var body: some View {
        Form {
            // Event superclass fields
            DatePicker("Event Date", selection: $happenedAt)
            TextField("Duration (seconds)", value: $lastingTime, formatter: numberFormatter)
            TextField("Latitude", value: $location.latitude, formatter: numberFormatter)
            TextField("Longitude", value: $location.longitude, formatter: numberFormatter)
                       
            VStack(alignment: .leading) {
                           Text("Dangerous Level: \(dangerousLevel)")
                           Slider(value: Binding(
                               get: { Double(dangerousLevel) },
                               set: { dangerousLevel = Int($0) }
                           ), in: 1...10, step: 1)
                       }

            TextField("Fun Level", value: $funLevel, formatter: NumberFormatter())
            TextField("Temperature", value: $temp, formatter: NumberFormatter())
            TextField("Radius", value: $radius, formatter: NumberFormatter())
            TextField("URL", text: $url)
            
            // Night Market-specific fields
            TextField("Event Name", text: $name)
            
            DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
            DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
            Toggle("Family Friendly", isOn: $isFamilyFriendly)
            Toggle("Indoor", isOn: $isIndoor)
            Toggle("Free", isOn: $isFree)
            Toggle("Parking Available", isOn: $parkingAvailable)
            
            Button("Save") {
                saveEventToFirebase()
            }
        }
        .navigationBarTitle("Edit Night Market Event")
    }
    
    private func saveEventToFirebase() {
//        guard let uid = Auth.auth().currentUser?.uid else {
//            print("User not logged in")
//            return
//        }
        
        let db = Firestore.firestore()
        
        // Prepare event data with both Event and NightMarketEvent fields
        let eventData: [String: Any] = [
            "happenedAt": Timestamp(date: happenedAt),
            "lastingTime": lastingTime,
            "location": ["latitude": location.latitude, "longitude": location.longitude],
            "dangerousLevel": dangerousLevel,
            "funLevel": funLevel,
            "temp": temp,
            "radius": radius,
            "url": url,
            
            // Night Market-specific data
            "name": name,
            "foodSpecialties": foodSpecialties,
            "rating": rating ?? 0.0,
            "isFamilyFriendly": isFamilyFriendly,
            "stallCount": stallCount,
            
            "startTime": Timestamp(date: startTime),
            "endTime": Timestamp(date: endTime),
            "isIndoor": isIndoor,
            "safetyMeasures": safetyMeasures,
            "eventImageURL": eventImageURL ?? "",
            "ticketPriceRange": ticketPriceRange ?? "",
            "isFree": isFree,
            "parkingAvailable": parkingAvailable,
            "isSoldOut": isSoldOut,
            
        ]
        guard let eventType = selectedEventType else {
               print("Event type is not selected")
               return
           }
        // Organize as UID -> EventType -> EventData
        db.collection(eventType).addDocument(data: eventData)  { error in
            if let error = error {
                print("Error saving event: \(error.localizedDescription)")
            } else {
                print("Event saved successfully!")
            }
        }
    }
    
}


struct EarthquakeForm: View {
    @Binding var eventDescription: String
    
    var body: some View {
        VStack {
            TextField("Earthquake Level", text: .constant(""))
            TextField("Number of Deaths", text: .constant(""))
            TextField("Event Description", text: $eventDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save Earthquake") {
                // Save the Earthquake event
            }
        }
    }
}

struct PartyForm: View {
    @Binding var eventDescription: String
    
    var body: some View {
        VStack {
            TextField("Number of People", text: .constant(""))
            TextField("Party Location", text: .constant(""))
            TextField("Event Description", text: $eventDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save Party") {
                // Save the Party event
            }
        }
    }
}
