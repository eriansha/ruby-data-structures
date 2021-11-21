require 'rspec'
require_relative 'node'

describe 'Node' do
  describe '#value' do
    it 'should return value 1 if we initialize with 1' do
      node = Node.new(1)
      expect(node.value).to eq(1)
    end
  end

  describe '#left' do
    it 'should return nil when first initialize' do
      node = Node.new(1)
      expect(node.left).to eq(nil)
    end
  end

  describe '#right' do
    it 'should return nil when first initialize' do
      node = Node.new(1)
      expect(node.right).to eq(nil)
    end
  end
end
