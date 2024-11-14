import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.6273, longitude: 120.3194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var markerCoordinate: CLLocationCoordinate2D? = nil
    @State private var isPlacingMarkerEnabled = false
    @State private var isButtonTapped = false
   
    @State private var isSheetPresented = false
    @State private var selectedEventType: String? = nil  // Add selected event type state
    @State private var eventDescription: String = "" // Add event description state
    
    var body: some View {
        
        NavigationStack {
            TabView {
                // First tab - MapView Content with Button to place marker
                ZStack {
                    
                    MapView(region: $region, markerCoordinate: $markerCoordinate , isPlacingMarkerEnabled: $isPlacingMarkerEnabled,
                            isSheetPresented: $isSheetPresented )
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            isPlacingMarkerEnabled = true
                            isButtonTapped.toggle()// Enable marker placement on tap
                        }) {
                            Image(systemName: "scope")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 4)
                                .padding(.bottom, 20)
                                .padding(.leading, 200)
                                .foregroundColor(isButtonTapped ? .red: .black)
                        }
                    }
                    
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .sheet(isPresented: $isSheetPresented) {
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
                                                   NightMarketEventEditView()
                                               }
                                                  
                        
                        Button("Dismiss") {
                            selectedEventType = ""
                            isSheetPresented = false
                            isPlacingMarkerEnabled = false
                            isButtonTapped = false
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
    @StateObject private var locationManager = LocationManager() // Location manager for handling location
    @Binding var region: MKCoordinateRegion // This will hold the current region
    @Binding var markerCoordinate: CLLocationCoordinate2D? // Binding to the marker's coordinate

    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var hoverCoordinates: CLLocationCoordinate2D? = nil
    
    @Binding var isPlacingMarkerEnabled: Bool
    @Binding var isSheetPresented: Bool

    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $cameraPosition) {
                    // Show user's location
                    UserAnnotation()
                    
                    // If there's a marker coordinate, show the marker
                    if let coordinate = markerCoordinate {
                        Marker(coordinate: coordinate) {
                            Image(systemName: "pin.circle.fill") // Custom annotation icon
                                .foregroundColor(.red)  // Set the color of the marker
                                .font(.title)
                        }
                    }
                }
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.startUpdatingLocation()
                }
                .onTapGesture { position in
                    if isPlacingMarkerEnabled, let coordinate = proxy.convert(position, from: .local) {
                        print("Tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
                        markerCoordinate = coordinate
                        isPlacingMarkerEnabled = false
                        isSheetPresented = true
                    }
                }
                .mapControls {
                    MapScaleView() // Display the map scale
                    MapCompass() // Display the compass
                    MapUserLocationButton() // Button to center map on user's location
                }
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                Color.clear.frame(height: 60) // Adjust height as needed
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


// Preview provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

