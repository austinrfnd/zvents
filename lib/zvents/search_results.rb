module Zvents
    class SearchResults
        require 'zvents/event'
        require 'zvents/venue'
        include Virtus.model

        attribute :events, Array[Event]
        attribute :venues, Array[Venue]
    end
end
