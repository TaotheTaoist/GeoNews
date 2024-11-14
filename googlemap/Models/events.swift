import Foundation
import CoreLocation

class Event: ObservableObject, Identifiable, Equatable {
    @Published var happenedAt: Date
    @Published var lastingTime: TimeInterval
    @Published var location: CLLocationCoordinate2D
    @Published var dangerousLevel: Int
    @Published var funLevel: Int
    @Published var temp: Double
    @Published var radius: Double
    @Published var url: String
  
    
    var id = UUID()  // Unique identifier for Identifiable conformance
    
    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String) {
        self.happenedAt = happenedAt
        self.lastingTime = lastingTime
        self.location = location
        self.dangerousLevel = dangerousLevel
        self.funLevel = funLevel
        self.temp = temp
        self.radius = radius
        self.url = url
        
    }
    
    // Equatable implementation for Event
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id &&
               lhs.happenedAt == rhs.happenedAt &&
               lhs.lastingTime == rhs.lastingTime &&
               lhs.dangerousLevel == rhs.dangerousLevel &&
               lhs.funLevel == rhs.funLevel &&
               lhs.temp == rhs.temp &&
               lhs.radius == rhs.radius &&
               lhs.url == rhs.url
    }

}

