require 'rspec'
require_relative 'search_algorithm'

describe 'SearchAlgorithm' do
  it 'should return nil if search 1 in empty array' do
    series = []
    expect(SearchAlgorithm.find_index(series, 1)).to eq(nil)
  end

  it 'should return 0-index if search 1 in [1]' do
    series = [1]
    expect(SearchAlgorithm.find_index(series, 1)).to eq(0)
  end

  it 'should return 1-index if search 2 in [1, 2]' do
    series = [1, 2]
    expect(SearchAlgorithm.find_index(series, 2)).to eq(1)
  end

  it 'should return nil if search 3 in [1, 2]' do
    series = [1, 2]
    expect(SearchAlgorithm.find_index(series, 3)).to eq(nil)
  end

  it 'should return 3-index if search 4 in [1, 2, 3, 4, 5]' do
    series = [1, 2, 3, 4, 5]
    expect(SearchAlgorithm.find_index(series, 4)).to eq(3)
  end

  it 'should return nil if search 6 in [1, 2, 3, 4, 5]' do
    series = [1, 2, 3, 4, 5]
    expect(SearchAlgorithm.find_index(series, 6)).to eq(nil)
  end

  it 'should return 49-index if search 50 in [1, 2 ,3 ... 100]' do
    series = [*1..100]
    expect(SearchAlgorithm.find_index(series, 50)).to eq(49)
  end
end