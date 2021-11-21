require 'rspec'
require_relative 'sort_algorithm'

describe 'SortAlgorithm' do
  it 'should return [] when sorting []' do
    input_array = []
    expect(SortAlgorithm.sort(input_array)).to eq([])
  end

  it 'should return [1] when sorting [1]' do
    input_array = [1]
    expect(SortAlgorithm.sort(input_array)).to eq([1])
  end

  it 'should return [1, 2] when sorting [2, 1]' do
    input_array = [2, 1]
    expect(SortAlgorithm.sort(input_array)).to eq([1, 2])
  end

  it 'should return [1, 2, 3, 4] when sorting [3, 1, 4, 2]' do
    input_array = [3, 1, 4, 2]
    expect(SortAlgorithm.sort(input_array)).to eq([1, 2, 3, 4])
  end

  it 'should return [1, 2, 6, 7, 8, 9, 10] when sorting [10, 9, 8, 7, 6, 2, 1]' do
    input_array = [10, 9, 8, 7, 6, 2, 1]
    expect(SortAlgorithm.sort(input_array)).to eq([1, 2, 6, 7, 8, 9, 10])
  end
end