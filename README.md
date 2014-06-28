# Zvents

This is a ruby wrapper around the Zvents API.

## Installation

Add this line to your application's Gemfile:

    gem 'zvents'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zvents

## Usage


```ruby

# set api key
Zvents::Event.api_key '123'

# Finding an event
event = Zvents::Event.find('event_id')

# Finding the venue of an eventt
event = Zvents::Event.find('event_id')
venue = event.venue

# Finding a venue
venue = Zvents::Venue.find('venue_id')

# Searching
search_results = Zvents.search('search parameters')
### search parameters are what, where, when, radius, limit, offset, spn_limit, 
### cat, has_kids, city, neighborhood. trim. has_ticket, sequence
ex:
search_results = Zvents.search({where: "San Francisco"})
events = search_results.events
venues = search_results.venues

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



```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/zvents/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
