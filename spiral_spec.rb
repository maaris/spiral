load 'spiral.rb'

describe Spiral do

  context 'matrix ordering' do

    it 'should order matrix from 3 numbers a column/row' do
      spiral = Spiral.new [
        [1,2,3],
        [4,5,6],
        [7,8,9]
      ]
      spiral.order!.should == [1,2,3,6,9,8,7,4,5]
    end

    it 'should order matrix from 4 numbers a column/row' do
      spiral = Spiral.new [
        [ 1, 2, 3, 4],
        [ 5, 6, 7, 8],
        [ 9,10,11,12],
        [13,14,15,16]
      ]
      spiral.order!.should == [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]
    end

  end

end
