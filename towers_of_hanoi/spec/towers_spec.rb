require 'towers'

describe TowersGame do
    describe "#initialize" do
        subject (:towers_game) { TowersGame.new(5) }
        it "should have 3 arrays (towers)" do
            expect(towers_game.towers.length).to eq 3
            towers_game.all? do |el| 
                expect(el).to be_a(Array)
            end
        end

        it "the first tower should be stacked" do 
            expect(towers_game.towers[0]).to eq [5,4,3,2,1]
        end

        it "should stack the tower in ascending order" do
            towers_game.towers.all? do |el|
                expect(el).to eq el.sort.reverse
            end
        end
    end

    describe "#render" do
       it "should display 3 arrays" 
    end
    
    describe "#input" do
        it "should use #gets for input" do
            
        end
    end

    describe "#movedisc" do
        it "should let you pick which array you take a disc from"
        it "should let you pick which array you move the disc to"
        it "should implement a move"
    end

    describe "#won" do
        it "should check if game is over"
    end
end