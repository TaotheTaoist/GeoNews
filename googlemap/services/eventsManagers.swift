import Foundation
import Combine
import CoreLocation


class EventManager: ObservableObject {
    @Published var events: [Event] = []  // Store all events

    // Simulating fetching events from an API (replace with actual network call)
    func fetchEvents() {
        // Sample data, in a real app, you'd make a network call to fetch data.
        let earthquakeEvent = EarthquakeEvent(
            happenedAt: Date(),
            lastingTime: 3600,
            location: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            dangerousLevel: 8,
            funLevel: 3,
            temp: 20.0,
            radius: 10.0,
            url: "https://google.com",
            earthquakeLevel: 7,
            numberOfDeaths: 100
        )
        let partyEvent = PartyEvent(
            happenedAt: Date(),
            lastingTime: 7200,
            location: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            dangerousLevel: 1,
            funLevel: 10,
            temp: 25.0,
            radius: 5.0,
            url: "https://google.com",
            numberOfPeople: 150,
            isScheduled: true
        )
        
        // Adding events to the list
        self.events = [earthquakeEvent, partyEvent]
    }
    
    // Function to create a new event
    func createNewEvent(event: Event) {
        events.append(event)
    }
    
    // Function to update an existing event
    func updateEvent(event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
        }
    }
    
    // Function to remove an event (optional)
    func removeEvent(event: Event) {
        events.removeAll { $0.id == event.id }
    }
}
