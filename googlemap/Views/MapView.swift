
//import SwiftUI
//import MapKit
//
//struct MapView: View {
//    @StateObject private var locationManager = LocationManager() // Location manager for handling location
//    @Binding var region: MKCoordinateRegion // This will hold the current region
//    @Binding var markerCoordinate: CLLocationCoordinate2D? // Binding to the marker's coordinate
//
//    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
//    @State private var hoverCoordinates: CLLocationCoordinate2D? = nil
//
//    var body: some View {
//        VStack {
//            MapReader { proxy in
//                Map(position: $cameraPosition) {
//                    // Show user's location
//                    UserAnnotation()
//
//                    // If there's a marker coordinate, show the marker
//                    if let coordinate = markerCoordinate {
//                        Marker(coordinate: coordinate) {
//                            Image(systemName: "pin.circle.fill") // Custom annotation icon
//                                .foregroundColor(.red)  // Set the color of the marker
//                                .font(.title)
//                        }
//                    }
//                }
//                .onAppear {
//                    locationManager.requestWhenInUseAuthorization()
//                    locationManager.startUpdatingLocation()
//                    
//                        
//                }
//                
//                .onTapGesture {
//                    position in
//                    if let coordinate = proxy.convert(position, from: .local){
//                        
//                        print(coordinate)
//                        
//                        let mtPlacemark = MTPlacemark(name: "", address: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
//                        markerCoordinate = coordinate
//                        
//                    }
//                }
//            }
//
//            // Display the hover coordinates (latitude and longitude)
//            if let coordinates = hoverCoordinates {
//                Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
//                    .padding()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 22.6273, longitude: 120.3194),
//        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    )
//
//    @State private var markerCoordinate: CLLocationCoordinate2D? = nil
//
//    var body: some View {
//        VStack {
//            MapView(region: $region, markerCoordinate: $markerCoordinate)
//
//            // A button to simulate placing a marker (optional)
//            Button("Place Marker") {
//                let newCoordinate = CLLocationCoordinate2D(latitude: 22.6273, longitude: 120.3194)
//                markerCoordinate = newCoordinate
//                
//            }
//            .padding()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//import SwiftUI
//import MapKit

// MapView component
//struct MapView: View {
//    @StateObject private var locationManager = LocationManager() // Location manager for handling location
//    @Binding var region: MKCoordinateRegion // This will hold the current region
//    @Binding var markerCoordinate: CLLocationCoordinate2D? // Binding to the marker's coordinate
//
//    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
//    @State private var hoverCoordinates: CLLocationCoordinate2D? = nil
//
//    var body: some View {
//        ZStack {
//            MapReader { proxy in
//                Map(position: $cameraPosition) {
//                    // Show user's location
//                    UserAnnotation()
//
//                    // If there's a marker coordinate, show the marker
//                    if let coordinate = markerCoordinate {
//                        Marker(coordinate: coordinate) {
//                            Image(systemName: "pin.circle.fill") // Custom annotation icon
//                                .foregroundColor(.red)  // Set the color of the marker
//                                .font(.title)
//                        }
//                    }
//                }
//                .onAppear {
//                    locationManager.requestWhenInUseAuthorization()
//                    locationManager.startUpdatingLocation()
//                }
//                .onTapGesture { position in
//                    if let coordinate = proxy.convert(position, from: .local) {
//                        print("Tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
//                        markerCoordinate = coordinate
//                    }
//                }
//                .mapControls {
//                    MapScaleView() // Display the map scale
//                    MapCompass() // Display the compass
//                    MapUserLocationButton() // Button to center map on user's location
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.all) // Ensure the map fills the entire screen
//    }
//}
