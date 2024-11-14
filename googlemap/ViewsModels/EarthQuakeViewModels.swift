import SwiftUI

class EarthquakeViewModel: ObservableObject {
    @ObservedObject var eventManager: EventManager
    
    @Published var earthquakeEvents: [EarthquakeEvent] = [] // Store Earthquake Events
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
    }
    
    // Function to load earthquake events
    func loadEarthquakeEvents() {
        earthquakeEvents = eventManager.events.filter { $0 is EarthquakeEvent } as! [EarthquakeEvent]
    }
    
    // Function to add a new Earthquake event
    func addEarthquakeEvent(event: EarthquakeEvent) {
        eventManager.createNewEvent(event: event)
        loadEarthquakeEvents() // Refresh the events list
    }
    
    // Function to update an Earthquake event
    func updateEarthquakeEvent(event: EarthquakeEvent) {
        eventManager.updateEvent(event: event)
        loadEarthquakeEvents() // Refresh the events list
    }
    
}
