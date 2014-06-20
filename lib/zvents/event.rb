module Zvents
    class Event
        require 'zvents/venue'
        include Virtus.model

        RESOURCE_URL = '/partner_rest/event'

        attribute :avg_ratings, Array
        attribute :categories, Array
        attribute :creator, String
        attribute :description, String
        attribute :endtime, String
        attribute :external_urls, Array
        attribute :id, Integer
        attribute :images, Array
        attribute :link, String
        attribute :name, String
        attribute :parent_id, Integer
        attribute :performers, Array
        attribute :phone, String
        attribute :price, String
        attribute :recurrences, Array
        attribute :sponsored_data, Array
        attribute :starttime, String
        attribute :summary, String
        attribute :tags, Array
        attribute :url, String
        attribute :venue, Venue
        attribute :venue_id, Integer
        
        # Zvent::Event.find('123123') => an instance of an event
        # 
        def self.find(id)
            response = Zvents.find(RESOURCE_URL, id)
            
            if response.body['rsp']['status'] != 'ok'
                raise Zvents::EventNotFoundError.new("could not find event with id #{id}") 
            end
            venue_hash = Hash.new
            venue_hash[:venue] = response.body['rsp']['content']['venues'].first
            self.new(response.body['rsp']['content']['events'].first.merge(venue_hash))
        end
        
        # venue() => an instance of the venue where the event takes place
        #
        def venue
            @venue ||= Zvents::Venue.find(@venue_id)
        end
    end
end
