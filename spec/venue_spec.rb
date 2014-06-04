describe "Venue" do
    describe "initialize" do
        it "should initialize with some attributes" do
            venue = Zvents::Venue.new({creator: 'Austin Fonacier'})
            expect(venue.creator).to eql("Austin Fonacier")
        end # rake
    end
    
    describe 'self.find' do
        before :each do
            Zvents.api_key = ENV['ZVENT_API_KEY']
        end
        it "should return a new venue instance" do
            venue = Zvents::Venue.find(17369152)
            expect(venue).to be_kind_of(Zvents::Venue)
        end
        
        it "should throw an error if no venue can be found" do
            expect {
                Zvents::Venue.find('bad_id')
            }.to raise_error(Zvents::VenueNotFoundError)
        end
    end
end
