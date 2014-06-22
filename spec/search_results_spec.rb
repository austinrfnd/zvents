describe "SearchResults" do
    describe "initialize" do
        it "should initialize with some attributes" do
            search_results = Zvents::SearchResults.new({events: [{creator: 'Austin Fonacier'}]})
            expect(search_results.events.first.creator).to eql("Austin Fonacier")
        end # rake
    end
end
