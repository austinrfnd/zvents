# Zvents

[![Code Climate](https://codeclimate.com/github/austinrfnd/zvents.png)](https://codeclimate.com/github/austinrfnd/zvents)

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

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/zvents/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
