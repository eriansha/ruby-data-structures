require 'rspec'
require_relative 'depth_first_search'
require_relative 'node'

describe 'DepthFirstSearch' do
  describe '#hasPath' do
    it 'should return true if it\'s search itself' do
      node = Node.new(32)

      expect(DepthFirstSearch.hasPath(node, node)).to eq(true)
    end

    it 'should return true if the path is found' do
      first_node = Node.new(32)
      sec_node = Node.new(99)
      third_node = Node.new(78)

      sec_node.leaves << third_node
      first_node.leaves << sec_node

      expect(DepthFirstSearch.hasPath(first_node, third_node)).to eq(true)
    end

    it 'should return false if the path is not found' do
      first_node = Node.new(32)
      sec_node = Node.new(99)
      third_node = Node.new(78)

      first_node.leaves << sec_node

      expect(DepthFirstSearch.hasPath(first_node, third_node)).to eq(false)
    end
  end
end
