require 'rspec'
require_relative 'stack'

describe 'Stack' do
  it 'should return true if stack is empty' do
    stack = Stack.new
    expect(stack.empty?).to eq(true)
  end

  it 'should return [1, 2] if stack is filled' do
    stack = Stack.new(1, 2)
    expect(stack.to_a).to eq([1, 2])
  end

  it 'should return [1] if stack push 1' do
    stack = Stack.new
    stack.push(1)
    expect(stack.to_a).to eq([1])
  end

  it 'should return [6, 3] if stack push 6, then push 3' do
    stack = Stack.new
    stack.push(6)
    stack.push(3)

    expect(stack.to_a).to eq([6, 3])
  end

  it 'should return [1, 2] if stack [1, 2, 3] has been popped' do
    stack = Stack.new(1, 2, 3)
    stack.pop
    expect(stack.to_a).to eq([1, 2])
  end

  it 'should be return 3 when stack [1, 2, 3] is popped' do
    stack = Stack.new(1, 2, 3)
    expect(stack.pop).to eq(3)
  end
end
