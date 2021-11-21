require 'rspec'
require_relative 'node'

describe 'Node' do
  it 'should create Node' do
    node = Node.new(3)
    
    expect(node.data).to eq(3)
  end

  it 'should be return nil if there is no next node' do
    node = Node.new(3)
    
    expect(node.next_node).to eq(nil)
  end

  it 'should be able to access next node' do
    node = Node.new(3)
    next_node = Node.new(32)
    node.next_node = next_node

    expect(node.next_node).to eq(next_node)
  end
end
