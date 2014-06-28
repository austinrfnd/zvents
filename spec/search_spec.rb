describe "Search" do
    describe "search" do
        before :each do
            Zvents.api_key = ENV['ZVENT_API_KEY']
        end
        it "should search by some parameters and return a new search results instance" do
            search = Zvents.search({where: 'San Franciso'})
            expect(search).to be_kind_of(Zvents::SearchResults)
        end # rake
        it "should initialize the venues for the events if it can" do
            search = Zvents.search({where: 'San Francisco'})
            search.events.each do |event|
                expect(event.venue.id).to eq(event.venue_id)
            end
        end
    end   
end
