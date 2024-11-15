import SwiftUI
import MapKit
import UIKit

struct ContentView: View {
      
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.6273, longitude: 120.3194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var markerCoordinate: CLLocationCoordinate2D? = nil
    @State private var isPlacingMarkerEnabled = false
//    @State private var isButtonTapped = false
//    @EnvironmentObject var eventViewModel: EventViewModel
    
    @StateObject private var eventViewModel = EventViewModel()
    
    @State private var isSheetPresented = false
    
    @State private var selectedEventType: String? = nil
    @State private var eventDescription: String = ""
//    @StateObject private var eventViewModel = EventViewModel()
    
    @State private var isBottomSheetPresented = true
    
    var body: some View {
        
        NavigationStack {
            TabView {
                
                ZStack {
                    
                    MapView(region: $region, markerCoordinate: $markerCoordinate , isPlacingMarkerEnabled: $isPlacingMarkerEnabled,
                            isSheetPresented: $isSheetPresented).environmentObject(eventViewModel)
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            isPlacingMarkerEnabled = true
                            eventViewModel.isButtonTapped.toggle()// Enable marker placement on tap
                        }) {
                            Image(systemName: "scope")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 4)
                                .padding(.bottom, 20)
                                .padding(.leading, 200)
                                .foregroundColor(eventViewModel.isButtonTapped ? .red : .black)
                        }
                    }
                    
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .sheet(isPresented: $isSheetPresented, onDismiss: {
                    // Customize what happens when the sheet is dismissed, either by button or dragging
                    selectedEventType = nil
                    isPlacingMarkerEnabled = false
                    eventViewModel.isButtonTapped = false
                }) {
                    VStack {
                        Text("Marker Details")
                            .font(.title)
                        if let coordinate = markerCoordinate {
                            Text("Latitude: \(coordinate.latitude)")
                            Text("Longitude: \(coordinate.longitude)")
                        }
                        
                        // Show event selection view
                        if selectedEventType == nil {
                            EventSelectionView(selectedEventType: $selectedEventType)
                        } else {
                            // Automatically redirect when an event type is selected
                            NightMarketEventEditView(location: Binding(
                                get: { markerCoordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0) }, // Provide default value
                                set: { markerCoordinate = $0 }
                            ), selectedEventType: $selectedEventType)
                        }
                        
                        
                        Button("Dismiss") {
                            selectedEventType = ""
                            isSheetPresented = false
                            isPlacingMarkerEnabled = false
                            eventViewModel.isButtonTapped = false
                        }
                        .padding(.top)
                    }
                    .padding()
                }
                
                VStack {
                    Text("Profile Content Here")
                    
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
           
        }
       
    }
      
}

struct MapView: View {
    
    @State private var coordinatesWithId: [(coordinate: CLLocationCoordinate2D, id: String)] = []
    
    @StateObject private var locationManager = LocationManager()
    @Binding var region: MKCoordinateRegion
    @Binding var markerCoordinate: CLLocationCoordinate2D?
    
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    
    @Binding var isPlacingMarkerEnabled: Bool
    @Binding var isSheetPresented: Bool
    
    @EnvironmentObject var eventViewModel: EventViewModel
    
//    @ObservedObject var eventViewModel: EventViewModel
    @State private var selectedMarker: (coordinate: CLLocationCoordinate2D, id: String)?
    
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $cameraPosition) {
                    // Show user's location
                    UserAnnotation()
                    
                    ForEach(coordinatesWithId, id: \.id) { location in
                                    Marker(coordinate: location.coordinate) {
                                        Button(action: {
                                            print("Tapped on marker with ID: \(location.id)")
                                            // Handle tapping marker to show details or edit
                                        }) {
                                            Text(location.id)
                                                .foregroundColor(.blue) // Customize the appearance
                                        }
                                    }
                                }
                            }
                
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.startUpdatingLocation()
                    
                    eventViewModel.fetchEventCoordinates { data in
                        self.coordinatesWithId = data
                        print(data)
                    }
                    
                }
               
//
                .onTapGesture { position in
                    if isPlacingMarkerEnabled, let coordinate = proxy.convert(position, from: .local) {
                        // First Gesture: Marker placement logic
                        print("Placing marker at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
                        markerCoordinate = coordinate
                        isPlacingMarkerEnabled = false
                        print("isPlacingMarkerEnabled: \(isPlacingMarkerEnabled) - Marker")
                        isSheetPresented = true
                    }
                }

                .mapControls {
                    MapScaleView() // Display the map scale
                    MapCompass() // Display the compass
                    MapUserLocationButton() // Button to center map on user's location
                }
                
            }
            
        }
      }
    
}


// Preview provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

