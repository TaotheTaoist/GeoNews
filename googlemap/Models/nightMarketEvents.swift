import Foundation
import CoreLocation

//
//class NightMarketEvent: Event {
//    // Add new properties specific to NightMarketEvent
//    @Published var name: String
//    @Published var foodSpecialties: [String]
//    @Published var rating: Double?
//    @Published var isFamilyFriendly: Bool
//    @Published var stallCount: Int
//    
//    @Published var address: String
//    @Published var startTime: Date
//    @Published var endTime: Date
//    @Published var isIndoor: Bool
//    @Published var safetyMeasures: String
//    @Published var eventImageURL: String?
//    @Published var ticketPriceRange: String?
//    @Published var isFree: Bool
//    @Published var parkingAvailable: Bool
//    @Published var isSoldOut: Bool
//    @Published var remainingTickets: Int
//    
//    
//    
//    // Initializer to pass parameters from Event and NightMarketEvent
//    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, name: String, foodSpecialties: [String], rating: Double? = nil, isFamilyFriendly: Bool = true, stallCount: Int = 0, eventType: String, address: String, startTime: Date, endTime: Date, isIndoor: Bool, safetyMeasures: String, eventImageURL: String? = nil, ticketPriceRange: String? = nil, isFree: Bool = false, parkingAvailable: Bool = true, isSoldOut: Bool = false, remainingTickets: Int = 100) {
//        
//        // Initialize new properties for NightMarketEvent first
//        self.name = name
//        self.foodSpecialties = foodSpecialties
//        self.rating = rating
//        self.isFamilyFriendly = isFamilyFriendly
//        self.stallCount = stallCount
//        
//        self.address = address
//        self.startTime = startTime
//        self.endTime = endTime
//        self.isIndoor = isIndoor
//        self.safetyMeasures = safetyMeasures
//        self.eventImageURL = eventImageURL
//        self.ticketPriceRange = ticketPriceRange
//        self.isFree = isFree
//        self.parkingAvailable = parkingAvailable
//        self.isSoldOut = isSoldOut
//        self.remainingTickets = remainingTickets
//        
//        // Call the superclass initializer to initialize inherited properties
//        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "Night Market")
//    }
//}
//class NightMarketEvent: Event {
//    // Add new properties specific to NightMarketEvent
//    var name: String
//    var foodSpecialties: [String]
//    var rating: Double?
//    var isFamilyFriendly: Bool
//    var stallCount: Int
//    
//    var address: String
//    var startTime: Date
//    var endTime: Date
//    var isIndoor: Bool
//    var safetyMeasures: String
//    var eventImageURL: String?
//    var ticketPriceRange: String?
//    var isFree: Bool
//    var parkingAvailable: Bool
//    var isSoldOut: Bool
//    var remainingTickets: Int
//    
//    // Initializer to pass parameters from Event and NightMarketEvent
//    init(happenedAt: Date, lastingTime: TimeInterval, location: CLLocationCoordinate2D, dangerousLevel: Int, funLevel: Int, temp: Double, radius: Double, url: String, name: String, foodSpecialties: [String], rating: Double? = nil, isFamilyFriendly: Bool = true, stallCount: Int = 0, eventType: String, address: String, startTime: Date, endTime: Date, isIndoor: Bool, safetyMeasures: String, eventImageURL: String? = nil, ticketPriceRange: String? = nil, isFree: Bool = false, parkingAvailable: Bool = true, isSoldOut: Bool = false, remainingTickets: Int = 100) {
//        
//        // Initialize new properties for NightMarketEvent first
//        self.name = name
//        self.foodSpecialties = foodSpecialties
//        self.rating = rating
//        self.isFamilyFriendly = isFamilyFriendly
//        self.stallCount = stallCount
//        
//        self.address = address
//        self.startTime = startTime
//        self.endTime = endTime
//        self.isIndoor = isIndoor
//        self.safetyMeasures = safetyMeasures
//        self.eventImageURL = eventImageURL
//        self.ticketPriceRange = ticketPriceRange
//        self.isFree = isFree
//        self.parkingAvailable = parkingAvailable
//        self.isSoldOut = isSoldOut
//        self.remainingTickets = remainingTickets
//        
//        // Call the superclass initializer to initialize inherited properties
//        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "Night Market")
//    }
//}
class NightMarketEvent: Event {
    // Add new properties specific to NightMarketEvent
    var name: String
    var foodSpecialties: [String]
    var rating: Double?
    var isFamilyFriendly: Bool
    var stallCount: Int
    
    var address: String
    var startTime: Date
    var endTime: Date
    var isIndoor: Bool
    var safetyMeasures: String
    var eventImageURL: String?
    var ticketPriceRange: String?
    var isFree: Bool
    var parkingAvailable: Bool
    var isSoldOut: Bool
    var remainingTickets: Int
    
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
        super.init(happenedAt: happenedAt, lastingTime: lastingTime, location: location, dangerousLevel: dangerousLevel, funLevel: funLevel, temp: temp, radius: radius, url: url, type: "Night Market")
    }

    // Required init(from:) to conform to Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode new properties specific to NightMarketEvent
        self.name = try container.decode(String.self, forKey: .name)
        self.foodSpecialties = try container.decode([String].self, forKey: .foodSpecialties)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.isFamilyFriendly = try container.decodeIfPresent(Bool.self, forKey: .isFamilyFriendly) ?? true
        self.stallCount = try container.decodeIfPresent(Int.self, forKey: .stallCount) ?? 0
        
        self.address = try container.decode(String.self, forKey: .address)
        self.startTime = try container.decode(Date.self, forKey: .startTime)
        self.endTime = try container.decode(Date.self, forKey: .endTime)
        self.isIndoor = try container.decode(Bool.self, forKey: .isIndoor)
        self.safetyMeasures = try container.decode(String.self, forKey: .safetyMeasures)
        self.eventImageURL = try container.decodeIfPresent(String.self, forKey: .eventImageURL)
        self.ticketPriceRange = try container.decodeIfPresent(String.self, forKey: .ticketPriceRange)
        self.isFree = try container.decode(Bool.self, forKey: .isFree)
        self.parkingAvailable = try container.decode(Bool.self, forKey: .parkingAvailable)
        self.isSoldOut = try container.decode(Bool.self, forKey: .isSoldOut)
        self.remainingTickets = try container.decode(Int.self, forKey: .remainingTickets)
        
        // Decode the inherited properties by calling the superclass's decoder
        try super.init(from: decoder)
    }

    // Enum to manage coding keys
    private enum CodingKeys: String, CodingKey {
        case name
        case foodSpecialties
        case rating
        case isFamilyFriendly
        case stallCount
        case address
        case startTime
        case endTime
        case isIndoor
        case safetyMeasures
        case eventImageURL
        case ticketPriceRange
        case isFree
        case parkingAvailable
        case isSoldOut
        case remainingTickets
    }
}
