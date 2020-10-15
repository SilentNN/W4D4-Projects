require "first"

describe Array do
    describe "#remove_dups" do

        before(:each) do
            expect_any_instance_of(Array).not_to receive(:uniq)
        end

        it "should remove duplicates from an array" do
            expect([1, 2, 1, 3, 3].remove_dups).to eq [1, 2, 3]
        end

        it "should return a new array" do
            a = [1,2,3]
            expect(a.remove_dups).to_not be a 
        end

    end

    describe "#two_sum" do
        it "should find all pairs of positions that sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq [[0, 4], [2, 3]]
        end

        # it "should be ordered with smaller index before larger index" do
        #     a = [-1, 0, 2, -2, 1]
        #     10.times do 
        #         a.shuffle!
        #         expect(a.two_sum).to eq [[0, 4], [2, 3]]
        #     end
        # end
    end

    describe "#my_transpose" do
        subject (:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }  

        before (:each) do
            expect_any_instance_of(Array).not_to receive(:transpose)
        end

        # it "should have the correct dimensions"

        it "should transpose the array" do
            expect(matrix.my_transpose).to eq [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
        end
    end

    describe "#stock_picker" do
        subject (:stocks) {[500, 450, 475, 480]}

        it "outputs most profitable pair of days" do
            expect([450, 475, 480].stock_picker).to eq [0, 2]
        end

        it "doesn't let you sell before you buy" do 
            expect(stocks.stock_picker).to eq [1, 3]
        end
    end


end