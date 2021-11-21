require 'rspec'
require_relative 'single_linked_list'

describe 'SingleLinkedList' do
  it 'should have head nil in first initialize' do
    linked_list = SingleLinkedList.new
    
    expect(linked_list.head).to eq(nil)
  end

  describe '#read' do
    it 'should return nil if node in certain index does not exist' do
      linked_list = SingleLinkedList.new
      expect(linked_list.read(32)).to eq(nil)
    end

    it 'should return a if read index 0' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')

      expect(linked_list.read(0)).to eq('a')
    end

    it 'should return c if read index 2' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      linked_list.insert('b')
      linked_list.insert('c')

      expect(linked_list.read(2)).to eq('c')
    end
  end

  describe '#insert' do
    it 'should insert new node in head' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')

      expect(linked_list.head.data).to eq('a')
    end

    it 'should insert multiple row in row sequencly' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      linked_list.insert('b')
      linked_list.insert('c')

      expect(linked_list.read(0)).to eq('a')
      expect(linked_list.read(1)).to eq('b')
      expect(linked_list.read(2)).to eq('c')
    end
  end

  describe '#insert_at' do
    it 'should insert new node at first index' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      linked_list.insert_at(0, 'b')

      expect(linked_list.read(0)).to eq('b')
      expect(linked_list.read(1)).to eq('a')
    end

    it 'should insert new node at last index' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      linked_list.insert('b')
      linked_list.insert_at(2, 'c')

      expect(linked_list.read(0)).to eq('a')
      expect(linked_list.read(1)).to eq('b')
      expect(linked_list.read(2)).to eq('c')
    end

    it 'should insert new node at the middle' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      linked_list.insert('b')
      linked_list.insert('c')
      linked_list.insert_at(2, 'x')

      expect(linked_list.read(0)).to eq('a')
      expect(linked_list.read(1)).to eq('b')
      expect(linked_list.read(2)).to eq('x')
      expect(linked_list.read(3)).to eq('c')
    end
  end

  describe '#delete' do
    it 'should return deleted node' do
      linked_list = SingleLinkedList.new
      linked_list.insert('a')
      deleted_node = linked_list.delete_at(0)

      expect(deleted_node.data).to eq('a')
    end

    context 'when delete first node (head)' do
      it 'should actually delete the head node' do
        linked_list = SingleLinkedList.new
        linked_list.insert('a')
        linked_list.delete_at(0)

        expect(linked_list.head).to eq(nil)
      end

      it 'should change the next node into new head' do
        linked_list = SingleLinkedList.new
        linked_list.insert('a')
        linked_list.insert('b')
        linked_list.delete_at(0)

        expect(linked_list.head.data).to eq('b')
      end
    end

    context 'when delete middle node' do
      it 'should ensure the next node would change the index position to be the index of deleted node' do
        linked_list = SingleLinkedList.new
        linked_list.insert('a')
        linked_list.insert('b')
        linked_list.insert('c')
        linked_list.delete_at(1)

        expect(linked_list.read(1)).to eq('c')
      end
    end

    context 'when delete last node' do
      it 'should ensure the previous node of the last node would be the last node (tail)' do
        linked_list = SingleLinkedList.new
        linked_list.insert('a')
        linked_list.insert('b')
        linked_list.insert('c')
        linked_list.delete_at(2)

        expect(linked_list.read(1)).to eq('b')
      end
    end

    it 'should test' do
        linked_list = SingleLinkedList.new
        linked_list.insert('a')
        linked_list.insert('b')
        linked_list.insert('c')
        linked_list.insert('e')
        linked_list.insert('f')
        linked_list.delete_at(1)
        linked_list.delete_at(3)
        linked_list.insert_at(1, 'x')
        linked_list.insert_at(6, 'z')

        expect(linked_list.read(0)).to eq('a')
        expect(linked_list.read(1)).to eq('x')
        expect(linked_list.read(2)).to eq('c')
        expect(linked_list.read(3)).to eq('e')
      end
  end
end
