require "my_array"
require "rspec"

describe Array do
    subject(:Array) {Array.new}
    
    
    describe "#my_uniq" do
        it "returns an array of unique elements" do
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        end
        it "returns the unique elements in the order in which the first appeared" do
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        end
    end
    describe "#two_sum" do
        it "returns an array of pairs that's sum is equal to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
        it "pairs must be sorted smaller index to larger index" do
            expect([2,1,5,-5,-2].two_sum).to eq([[0, 4], [2, 3]])
        end
        it "must be an Array" do
            expect { 5.two_sum }.to raise_error(NoMethodError)
        end
    end
    describe "#my_tranpose" do
        it "converts between the row-oriented and column-oriented representations" do
            expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0,3,6],[1,4,7],[2,5,8]])
        end
        it "2d array is not a square" do
            expect {my_transpose([[0,1,2],[3,4,5]])}.to raise_error(RuntimeError)
        end
    end

end

