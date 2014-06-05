require "zvents/version"
require "zvents/configuration"
require 'zvents/connection'
require 'zvents/errors'
require 'virtus'
require 'faraday'
require 'faraday_middleware'
require 'zvents/event'
require 'zvents/venue'

module Zvents
     private 
     def self.find(url, id)
          connection.get do |req|
                req.url url
                req.params['id'] = id
                req.params['key'] = api_key
                req.params['format'] = 'json'
          end
     end
end
