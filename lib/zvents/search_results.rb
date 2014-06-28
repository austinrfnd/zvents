module Zvents
    class SearchResults
        require 'zvents/event'
        require 'zvents/venue'
        include Virtus.model

        @venues_initialized
        attribute :events, Array[Event]
        attribute :venues, Array[Venue]
        
        def events
            unless @venues_initialized
                (0...@events.length).each do |i|
                    if @venues[i]
                        @events[i].venue = @venues[i]
                    end
                        #if event.venue_id == venue.id
                        #    event.venue = venue
                        #    break
                        # end
                    #end
                end
            end
            @venues_initialized = true
            @events
        end
    end
end
