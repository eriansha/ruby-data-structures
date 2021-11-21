require 'rspec'
require_relative 'queue'

describe 'Queue' do
  it 'should return nil if queue empty' do
    queue = Queue.new
    expect(queue.empty?).to eq(true)
  end

  it 'should enqueue 1 to the empty queue' do
    queue = Queue.new
    queue.enqueue(1)
    expect(queue.to_a).to eq([1])
  end

  it 'should return 1 when dequeue queue [1]' do
    queue = Queue.new(1)
    expect(queue.dequeue).to eq(1)
  end

  it 'should return [1, 2, 3] when enqueue 1, 2 and 3' do
    queue = Queue.new(1, 2, 3)
    expect(queue.to_a).to eq([1, 2, 3])
  end

  it 'should return 5 when dequeue [5, 4, 3, 2, 1]' do
    queue = Queue.new(5, 4, 3, 2, 1)
    expect(queue.dequeue).to eq(5)
  end

  it 'should return [1] when dequeue [3, 2, 1] twice' do
    queue = Queue.new(3, 2, 1)
    queue.dequeue
    queue.dequeue

    expect(queue.to_a).to eq([1])
  end
end