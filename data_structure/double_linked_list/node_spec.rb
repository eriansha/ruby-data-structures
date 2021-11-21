require 'rspec'
require_relative 'node'

describe 'Node' do
  it 'should create Node' do
    node = Node.new(3)
    
    expect(node.data).to eq(3)
  end

  context 'when accessing next node' do
    it 'should be return nil if there is no next node' do
      node = Node.new(3)
      
      expect(node.next_node).to eq(nil)
    end

    it 'should be return next node' do
      node = Node.new(1)
      next_node = Node.new(2)
      node.next_node = next_node
      
      expect(node.next_node).to eq(next_node)
    end

    it 'should ensure next node have same data before assignation' do
      node = Node.new(1)
      next_node = Node.new(2)
      node.next_node = next_node
      
      expect(node.next_node.data).to eq(next_node.data)
    end
  end

  context 'when accessing previous node' do
    it 'should be return nil if there is no next node' do
      node = Node.new(3)
      
      expect(node.next_node).to eq(nil)
    end

    it 'should be return previous node' do
      node = Node.new(2)
      previous_node = Node.new(1)
      node.previous_node = previous_node
      
      expect(node.previous_node).to eq(previous_node)
    end

    it 'should ensure previous node have same data before assignation' do
      node = Node.new(1)
      previous_node = Node.new(2)
      node.previous_node = previous_node
      
      expect(node.previous_node.data).to eq(previous_node.data)
    end
  end
end
