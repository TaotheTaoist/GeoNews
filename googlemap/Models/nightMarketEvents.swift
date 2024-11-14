import Foundation
import CoreLocation


class NightMarketEvent: Event {
    // Add new properties specific to NightMarketEvent
    @Published var name: String
    @Published var foodSpecialties: [String]
    @Published var rating: Double?
    @Published var isFamilyFriendly: Bool
    @Published var stallCount: Int
    
    @Published var address: String
    @Published var startTime: Date
    @Published var endTime: Date
    @Published var isIndoor: Bool
    @Published var safetyMeasures: String
    @Published var eventImageURL: String?
    @Published var ticketPriceRange: String?
    @Published var isFree: Bool
    @Published var parkingAvailable: Bool
    @Published var isSoldOut: Bool
    @Published var remainingTickets: Int
    
    // Initializer to pass parameters from Event and NightMarketEvent
    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, name: String, foodSpecialties: [String], rating: Double? = nil, isFamilyFriendly: Bool = true, stallCount: Int = 0, eventType: String, address: String, startTime: Date, endTime: Date, isIndoor: Bool, safetyMeasures: String, eventImageURL: String? = nil, ticketPriceRange: String? = nil, isFree: Bool = false, parkingAvailable: Bool = true, isSoldOut: Bool = false, remainingTickets: Int = 100) {
        
        // Initialize new properties for NightMarketEvent first
        self.name = name
        self.foodSpecialties = foodSpecialties
        self.rating = rating
        self.isFamilyFriendly = isFamilyFriendly
        self.stallCount = stallCount
        
        self.address = address
        self.startTime = startTime
        self.endTime = endTime
        self.isIndoor = isIndoor
        self.safetyMeasures = safetyMeasures
        self.eventImageURL = eventImageURL
        self.ticketPriceRange = ticketPriceRange
        self.isFree = isFree
        self.parkingAvailable = parkingAvailable
        self.isSoldOut = isSoldOut
        self.remainingTickets = remainingTickets
        
        // Call the superclass initializer to initialize inherited properties
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url)
    }
}
