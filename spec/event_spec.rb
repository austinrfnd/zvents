describe "Event" do
    describe "initialize" do
        it "should initialize with some attributes" do
            event = Zvents::Event.new({creator: 'Austin Fonacier'})
            expect(event.creator).to eql("Austin Fonacier")
        end # rake
    end
    
    describe 'self.find' do
        before :each do
            Zvents.api_key = ENV['ZVENT_API_KEY']
        end
        it "should return a new event instance" do
            event = Zvents::Event.find(370741694)
            expect(event).to be_kind_of(Zvents::Event)
        end
        
        it "should throw an error if no event can be found" do
            expect {
                Zvents::Event.find('bad_id')
            }.to raise_error(Zvents::EventNotFoundError)
        end
    end
    describe 'venue' do
        before :each do
            Zvents.api_key = ENV['ZVENT_API_KEY']
        end
        it "should return a new event instance" do
            event = Zvents::Event.find(370741694)
            expect(event.venue).to be_kind_of(Zvents::Venue)
        end
    end   
end
