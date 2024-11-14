//import Foundation
//import CoreLocation
//
//class PartyEvent: Event {
//    var numberOfPeople: Int
//    var isScheduled: Bool
//
//    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, numberOfPeople: Int, isScheduled: Bool) {
//        self.numberOfPeople = numberOfPeople
//        self.isScheduled = isScheduled
//        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url,type: "PartyEvent")
//    }
//}
import Foundation
import CoreLocation

class PartyEvent: Event {
    var numberOfPeople: Int
    var isScheduled: Bool

    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, numberOfPeople: Int, isScheduled: Bool) {
        self.numberOfPeople = numberOfPeople
        self.isScheduled = isScheduled
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "PartyEvent")
    }

    // Implement required initializer
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decoding properties of PartyEvent
        self.numberOfPeople = try container.decode(Int.self, forKey: .numberOfPeople)
        self.isScheduled = try container.decode(Bool.self, forKey: .isScheduled)

        // Decoding the superclass (Event) properties
        try super.init(from: decoder)
    }

    // Implement encoding function
    override func encode(to encoder: Encoder) throws {
        // Encoding PartyEvent specific properties
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(numberOfPeople, forKey: .numberOfPeople)
        try container.encode(isScheduled, forKey: .isScheduled)

        // Encoding the superclass (Event) properties
        try super.encode(to: encoder)
    }

    private enum CodingKeys: String, CodingKey {
        case numberOfPeople
        case isScheduled
    }
}
