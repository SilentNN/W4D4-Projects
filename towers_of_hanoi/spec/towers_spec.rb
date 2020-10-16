require 'towers'

describe TowersGame do
    subject (:towers_game) { TowersGame.new(5) }

    describe "#initialize" do
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
        it "should display 3 arrays" do
            expect{towers_game.render}.to output("5,4,3,2,1]"\n[]\n[]/)
        end

    end
    
    describe "#input" do
        it "should use #gets for input" do
            expect_any_instance_of(TowersGame).to receive(:gets)
        end
    end

    describe "#move_disc" do
        let(:tower1) { double( "towers_game", :input => 0 )}

        it "should call #input and move a disc based on result" do
            allow(towers_game).to receive(:input).and_return([0, 1])
            towers_game.move_disc
            expect(towers_game.towers[0]).to eq [5,4,3,2]
            expect(towers_game.towers[1]).to eq [1]
        end
    end

    describe "#won?" do
        let(:tower1) { double( "towers_game", :towers => [[], [], [5,4,3,2,1]] )}
        let(:tower2) { double( "towers_game", :towers => [[5], [4], [3,2,1]] )}

        it "should return true if last tower is completed" do
            expect(tower1.won?).to be_truthy
        end

        it "should return false if there are still discs in play" do
            expect(tower2.won?).to be_falsey
        end

    end
end