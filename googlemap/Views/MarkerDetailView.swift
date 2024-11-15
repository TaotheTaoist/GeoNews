import SwiftUI
import CoreLocation

struct MarkerDetailView: View {
    var marker: (coordinate: CLLocationCoordinate2D, id: String)
    
    var body: some View {
        VStack {
            Text("Marker ID: \(marker.id)")
                .font(.headline)
            Text("Coordinates: \(marker.coordinate.latitude), \(marker.coordinate.longitude)")
                .font(.subheadline)
            
            // You can add more details for the marker here
        }
        .padding()
    }
}

