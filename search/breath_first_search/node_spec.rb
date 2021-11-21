require 'rspec'
require_relative 'node'

describe 'Node' do
  describe '#value' do
    it 'should return value 1 if we initialize with 1' do
      node = Node.new(1)
      expect(node.value).to eq(1)
    end
  end

  describe '#leaves' do
    it 'should return empty list when we only add single node' do
      node = Node.new(1)
      expect(node.leaves).to eq([])
    end

    context 'one leaf' do
      it 'should ensure node has one leaf' do
        root_node = Node.new(1)
        root_node.leaves << Node.new(2)

        expect(root_node.leaves.length).to eq(1)
      end

      it 'should ensure first leaf is a same object' do
        root_node = Node.new(1)
        leaf_node = Node.new(2)
        root_node.leaves << leaf_node

        expect(root_node.leaves.first).to eq(leaf_node)
      end
    end

    context 'multiple leaves' do
      it 'should ensure node has two leaves' do
        root_node = Node.new(1)

        root_node.leaves << Node.new(2)
        root_node.leaves << Node.new(3)

        expect(root_node.leaves.length).to eq(2)
      end

      it 'should ensure first leaf is a same object' do
        root_node = Node.new(1)
        first_leaf_node = Node.new(2)
        sec_leaf_node = Node.new(2)
        
        root_node.leaves << first_leaf_node
        root_node.leaves << sec_leaf_node

        expect(root_node.leaves[0]).to eq(first_leaf_node)
        expect(root_node.leaves[1]).to eq(sec_leaf_node)
      end
    end
  end
end
