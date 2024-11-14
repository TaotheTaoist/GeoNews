import SwiftUI

class PartyViewModel: ObservableObject {
    @ObservedObject var eventManager: EventManager
    
    @Published var partyEvents: [PartyEvent] = [] // Store Party Events
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
    }
    
    // Function to load party events
    func loadPartyEvents() {
        partyEvents = eventManager.events.filter { $0 is PartyEvent } as! [PartyEvent]
    }
    
    // Function to add a new Party event
    func addPartyEvent(event: PartyEvent) {
        eventManager.createNewEvent(event: event)
        loadPartyEvents() // Refresh the events list
    }
    
    // Function to update a Party event
    func updatePartyEvent(event: PartyEvent) {
        eventManager.updateEvent(event: event)
        loadPartyEvents() // Refresh the events list
    }
}
