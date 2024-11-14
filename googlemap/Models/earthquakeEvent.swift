//import Foundation
//import CoreLocation
//
//class EarthquakeEvent: Event {
//    var earthquakeLevel: Int
//    var numberOfDeaths: Int
//
//    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, earthquakeLevel: Int, numberOfDeaths: Int) {
//        self.earthquakeLevel = earthquakeLevel
//        self.numberOfDeaths = numberOfDeaths
//        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "EarthQuakeEvent")
//    }
//}
import Foundation
import CoreLocation

class EarthquakeEvent: Event {
    var earthquakeLevel: Int
    var numberOfDeaths: Int

    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, earthquakeLevel: Int, numberOfDeaths: Int) {
        self.earthquakeLevel = earthquakeLevel
        self.numberOfDeaths = numberOfDeaths
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "EarthQuakeEvent")
    }

    // Implement required initializer
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decoding properties of EarthquakeEvent
        self.earthquakeLevel = try container.decode(Int.self, forKey: .earthquakeLevel)
        self.numberOfDeaths = try container.decode(Int.self, forKey: .numberOfDeaths)

        // Decoding the superclass (Event) properties
        try super.init(from: decoder)
    }

    // Implement encoding function
    override func encode(to encoder: Encoder) throws {
        // Encoding EarthquakeEvent specific properties
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(earthquakeLevel, forKey: .earthquakeLevel)
        try container.encode(numberOfDeaths, forKey: .numberOfDeaths)

        // Encoding the superclass (Event) properties
        try super.encode(to: encoder)
    }

    private enum CodingKeys: String, CodingKey {
        case earthquakeLevel
        case numberOfDeaths
    }
}
