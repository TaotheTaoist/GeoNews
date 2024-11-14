import Foundation
import CoreLocation

class EarthquakeEvent: Event {
    var earthquakeLevel: Int
    var numberOfDeaths: Int

    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, earthquakeLevel: Int, numberOfDeaths: Int) {
        self.earthquakeLevel = earthquakeLevel
        self.numberOfDeaths = numberOfDeaths
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url)
    }
}
