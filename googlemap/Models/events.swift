//import Foundation
//import CoreLocation
//
//class Event: Identifiable, Equatable,Codable {
//    var happenedAt: Date
//    var lastingTime: TimeInterval
//    var location: CLLocationCoordinate2D
//    var dangerousLevel: Int
//    var funLevel: Int
//   var temp: Double
//     var radius: Double
//     var url: String
//     var type: String
//
//    var id = UUID()
//    
//    // Initialization
//    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, type: String) {
//        self.happenedAt = happenedAt
//        self.lastingTime = lastingTime
//        self.location = location
//        self.dangerousLevel = dangerousLevel
//        self.funLevel = funLevel
//        self.temp = temp
//        self.radius = radius
//        self.url = url
//        self.type = type
//    }
//
//    // Equatable implementation for Event
//    static func == (lhs: Event, rhs: Event) -> Bool {
//        return lhs.id == rhs.id &&
//               lhs.happenedAt == rhs.happenedAt &&
//               lhs.lastingTime == rhs.lastingTime &&
//               lhs.dangerousLevel == rhs.dangerousLevel &&
//               lhs.funLevel == rhs.funLevel &&
//               lhs.temp == rhs.temp &&
//               lhs.radius == rhs.radius &&
//               lhs.url == rhs.url &&
//               lhs.type == rhs.type
//    }
//}
import Foundation
import CoreLocation

class Event: Identifiable, Equatable, Codable {
    var happenedAt: Date
    var lastingTime: TimeInterval
    var location: CLLocationCoordinate2D
    var dangerousLevel: Int
    var funLevel: Int
    var temp: Double
    var radius: Double
    var url: String
    var type: String  // Event type (e.g., "night market", "party")

    var id = UUID()  // Unique identifier for Identifiable conformance

    // Initialization
    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, type: String) {
        self.happenedAt = happenedAt
        self.lastingTime = lastingTime
        self.location = location
        self.dangerousLevel = dangerousLevel
        self.funLevel = funLevel
        self.temp = temp
        self.radius = radius
        self.url = url
        self.type = type
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
            lhs.url == rhs.url &&
            lhs.type == rhs.type
    }

    // Custom Encoding and Decoding for CLLocationCoordinate2D (location property)
    enum CodingKeys: String, CodingKey {
        case happenedAt
        case lastingTime
        case location
        case dangerousLevel
        case funLevel
        case temp
        case radius
        case url
        case type
        case id
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.happenedAt = try container.decode(Date.self, forKey: .happenedAt)
        self.lastingTime = try container.decode(TimeInterval.self, forKey: .lastingTime)
        self.dangerousLevel = try container.decode(Int.self, forKey: .dangerousLevel)
        self.funLevel = try container.decode(Int.self, forKey: .funLevel)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.radius = try container.decode(Double.self, forKey: .radius)
        self.url = try container.decode(String.self, forKey: .url)
        self.type = try container.decode(String.self, forKey: .type)
        self.id = try container.decode(UUID.self, forKey: .id)

        // Decoding location manually
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
        let latitude = try locationContainer.decode(Double.self, forKey: .latitude)
        let longitude = try locationContainer.decode(Double.self, forKey: .longitude)
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(happenedAt, forKey: .happenedAt)
        try container.encode(lastingTime, forKey: .lastingTime)
        try container.encode(dangerousLevel, forKey: .dangerousLevel)
        try container.encode(funLevel, forKey: .funLevel)
        try container.encode(temp, forKey: .temp)
        try container.encode(radius, forKey: .radius)
        try container.encode(url, forKey: .url)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)

        // Encoding location manually
        var locationContainer = container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
        try locationContainer.encode(location.latitude, forKey: .latitude)
        try locationContainer.encode(location.longitude, forKey: .longitude)
    }

    private enum LocationKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
