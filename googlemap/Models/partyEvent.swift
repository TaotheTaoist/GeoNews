import Foundation
import CoreLocation

class PartyEvent: Event {
    var numberOfPeople: Int
    var isScheduled: Bool

    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, numberOfPeople: Int, isScheduled: Bool) {
        self.numberOfPeople = numberOfPeople
        self.isScheduled = isScheduled
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url)
    }
}
