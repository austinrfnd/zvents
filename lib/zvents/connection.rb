module Zvents
    def self.connection
        @connection ||= Faraday.new(url: 'http://www.zvents.com/') do |faraday|
            faraday.request  :url_encoded             # form-encode POST params
            faraday.response :logger                  # log requests to STDOUT
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
            faraday.response :json
        end        
    end
end