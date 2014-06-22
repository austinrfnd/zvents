module Zvents
    class Venue
        include Virtus.model
        
        RESOURCE_URL = '/partner_rest/venue'

        attribute :address, String
        attribute :avg_ratings, Array
        attribute :city, String
        attribute :country, String
        attribute :creator, String
        attribute :description, String
        attribute :external_urls, Array
        attribute :id, Integer
        attribute :images, Array
        attribute :latitude, Float
        attribute :link, String
        attribute :longitude
        attribute :name, String
        attribute :neighborhood, String
        attribute :parent_id, Integer
        attribute :phone, String
        attribute :state, String
        attribute :tags, Array
        attribute :url, String
        attribute :zipcode, String
        
        # Zvent::Venue.find('123123') => an instance of a venue
        # 
        def self.find(id)
            parameters = {id: id}
            response = Zvents.find(RESOURCE_URL, parameters)
            
            if response.body['rsp']['status'] != 'ok'
                raise Zvents::VenueNotFoundError.new("could not find venue with id #{id}") 
            end
            self.new(response.body['rsp']['content']['venues'].first)
        end
    end
end
