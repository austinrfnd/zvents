describe "Search" do
    describe "search" do
        before :each do
            Zvents.api_key = ENV['ZVENT_API_KEY']
        end
        it "should search by some parameters and return a new search results instance" do
            search = Zvents.search({where: 'San Franciso'})
            expect(search).to be_kind_of(Zvents::SearchResults)
        end # rake
    end   
end
