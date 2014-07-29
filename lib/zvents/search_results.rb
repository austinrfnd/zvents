module Zvents
    class SearchResults
        require 'zvents/event'
        require 'zvents/venue'
        include Virtus.model

        attribute :events, Array[Event]
        attribute :venues, Array[Venue]
        
        def events
           unless @venues_initialized
                venue_hash = {} # A hash allows for this method to be run in linear time
                                # at the cost of space
                @venues.each do |venue|
                    venue_hash[venue.id] = venue
                end
                @events.each do |event|
                    event.venue = venue_hash[event.venue_id]
                end
            end
            @venues_initialized = true
            @events
        end
    end
end
