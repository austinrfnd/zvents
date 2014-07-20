module Zvents
    class SearchResults
        require 'zvents/event'
        require 'zvents/venue'
        include Virtus.model

        attribute :events, Array[Event]
        attribute :venues, Array[Venue]

        def events
            unless @venues_initialized
                @events.each do |event|
                    event.venue = @venues.detect{|venue| venue.id == event.venue_id}
                end
            end
            @venues_initialized = true
            @events
        end
    end
end
