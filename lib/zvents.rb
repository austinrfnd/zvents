require "zvents/version"
require "zvents/configuration"
require 'zvents/connection'
require 'zvents/errors'
require 'virtus'
require 'faraday'
require 'faraday_middleware'
require 'zvents/event'
require 'zvents/venue'
require 'zvents/search_results'

module Zvents
    # Zvents.search(parameters) => an instance of SearchResults
    #
    # can search by these parameters 
    # what = parameters[:what] e.g. "parade"
    # where = parameters[:where] e.g. "San Francisco", "94131", 
    #   "-74.0BY:40.9" (Latitude by longitude), "California"
    # when = parameters[:when] e.g. "monday to thursday",
    #   "10/30/2007 to 11/4/2007"
    # radius = parameters[:radius] 
    #   (number of miles around where field to search)
    # limit = parameters[:limit] (max number of items to return)
    # offset = parameters[:offset] (number of items to skip from
    #   beginning of the search results)
    # spn_limit = parameters[:spn_limit] (max number of sponsored
    #   items to return)
    # cat = parameters[:cat] (restrict your search to a specific
    #   category)
    # has_kids = parameters[:has_kids] (1 or 0. 
    #   1 means kid friendly. Events only)
    # city = parameters[:city]
    # neighborhood = parameters[:neighborhood]
    # trim = parameters[:trim] (0 or 1. 1 trims repeat events.
    #   default = 1)
    # has_tickets = parameters[:has_tickets] (0 or 1. 1 retuns
    #   only events with tickets for sale)
    # sequence = parameters[:sequence] (restrict search to events
    #   within a sequence. Multiple sequence ids can be provided
    #   separated by a comma)
      
    def self.search(parameters = {})
        resource_url = "/partner_rest/search"
        response = find(resource_url, parameters)
        if response.body['rsp']['status'] != 'ok'
              raise Zvents::SearchError.new("search failed") 
        end
        search_hash = response.body['rsp']['content']
        SearchResults.new(search_hash)
     end

     private 
     def self.find(url, parameters = {})
          connection.get do |req|
                req.url url
                req.params['key'] = api_key
                req.params['format'] = 'json'
                req.params.merge!(parameters)
          end
     end
end
