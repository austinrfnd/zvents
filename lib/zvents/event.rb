module Zvents
    class Event
        include Virtus.model
        
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
        attribute :venue_id, Integer
        
        # Zvent::Event.find('123123') => an instance of an event
        # 
        def self.find(id)
            response = Zvents.connection.get do |req|                           
                req.url '/partner_rest/event'
                req.params['id'] = id
                req.params['key'] = Zvents.api_key
                req.params['format'] = 'json'
            end
            
            if response.body['rsp']['status'] != 'ok'
                raise Zvents::EventNotFoundError.new("could not find event with id #{id}") 
            end
            self.new(response.body['rsp']['content']['events'].first)
        end
    end
end