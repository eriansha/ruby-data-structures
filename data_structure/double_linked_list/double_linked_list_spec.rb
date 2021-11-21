require 'rspec'
require_relative 'double_linked_list'

describe 'DoubleLinkedList' do
  describe '#initialize' do
    it 'should have no head' do
      double_linked_list = DoubleLinkedList.new

      expect(double_linked_list.head).to eq(nil)
    end

    it 'should have no tail' do
      double_linked_list = DoubleLinkedList.new

      expect(double_linked_list.tail).to eq(nil)
    end
  end

  describe '#read' do
    it 'should read nil if the node does not found' do 
      double_linked_list = DoubleLinkedList.new
      
      expect(double_linked_list.read(99)).to eq(nil)
    end

    it 'should return a if read index 0' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.insert_at_beginning('a')

      expect(double_linked_list.read(0)).to eq('a')
    end

    it 'should return c if read index 2' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.insert_at_beginning('a')
      double_linked_list.insert_at_beginning('b')
      double_linked_list.insert_at_beginning('c')

      expect(double_linked_list.read(2)).to eq('a')
    end
  end

  describe '#append' do
    it 'should ensure appended node become head if there\' no any node' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.append('a')

      expect(double_linked_list.head.data).to eq('a')
    end

    it 'should ensure the appended node become tail if there\' more than one node' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.append('a')

      expect(double_linked_list.tail.data).to eq('a')
    end

    it 'should ensure appended node have right order' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.append('a')
      double_linked_list.append('b')
      double_linked_list.append('c')

      first_node = double_linked_list.head
      second_node = first_node.next_node
      third_node = second_node.next_node

      expect(first_node.data).to eq('a')
      expect(second_node.data).to eq('b')
      expect(third_node.data).to eq('c')
    end

  end

  describe '#insert_at_beginning' do
    context 'when linked list is empty' do
      it 'should ensure new node become head' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_beginning('a')

        expect(double_linked_list.head.data).to eq('a')
      end

      it 'should ensure new node become tail' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_beginning('a')

        expect(double_linked_list.tail.data).to eq('a')
      end
    end

    context 'when linked list contains node(s)' do
      it 'should replace head into new node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_beginning('a')
        double_linked_list.insert_at_beginning('b')

        expect(double_linked_list.head.data).to eq('b')
      end

      it 'should ensure next node of the new node is the previous head' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_beginning('a')
        double_linked_list.insert_at_beginning('b')

        expect(double_linked_list.head.next_node.data).to eq('a')
      end

      context 'when only contain two nodes' do
        it 'should ensure previous head still become tail' do
          double_linked_list = DoubleLinkedList.new
          double_linked_list.insert_at_beginning('a')
          double_linked_list.insert_at_beginning('b')

          expect(double_linked_list.tail.data).to eq('a')
        end

       it 'should be connected between two nodes' do
         double_linked_list = DoubleLinkedList.new
         double_linked_list.insert_at_end('z')
         double_linked_list.insert_at_beginning('a')

         head = double_linked_list.head
         tail = double_linked_list.tail
         
         expect(head.next_node).to eq(tail)
         expect(tail.previous_node).to eq(head)
       end
      end
    end
  end

  describe '#insert_at_end' do
    context 'when linked list is empty' do
      it 'should ensure new node as tail' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_end('x')

        expect(double_linked_list.tail.data).to eq('x')
      end

      it 'should ensure new node as head' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_end('x')

        expect(double_linked_list.head.data).to eq('x')
      end
    end

    context 'when linked list contains node(s)' do
      it 'should replace tail into new node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_end('x')
        double_linked_list.insert_at_end('y')

        expect(double_linked_list.tail.data).to eq('y')
      end

      it 'should ensure previous node of the new node is the previous tail' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.insert_at_end('x')
        double_linked_list.insert_at_end('y')

        expect(double_linked_list.tail.previous_node.data).to eq('x')
      end

      context 'when only contain two nodes' do
        it 'should ensure previous tail still become head' do
          double_linked_list = DoubleLinkedList.new
          double_linked_list.insert_at_end('x')
          double_linked_list.insert_at_end('y')

          expect(double_linked_list.head.data).to eq('x')
        end


        it 'should be connected between two nodes' do
          double_linked_list = DoubleLinkedList.new
          double_linked_list.insert_at_beginning('z')
          double_linked_list.insert_at_end('a')

          head = double_linked_list.head
          tail = double_linked_list.tail
          
          expect(head.next_node).to eq(tail)
          expect(tail.previous_node).to eq(head)
        end
      end
    end
  end

  describe '#delete_at_beginning' do
    it 'should return deleted node' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.append('a')
      deleted_node = double_linked_list.delete_at_beginning

      expect(deleted_node.data).to eq('a')
    end

    context 'when just single node' do
      it 'should actually delete the head node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.delete_at_beginning

        expect(double_linked_list.head).to eq(nil)
      end

      it 'should actually delete the tail node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.delete_at_beginning

        expect(double_linked_list.tail).to eq(nil)
      end
    end

    context 'when it contains more than one node' do
      it 'should change the next node into new head' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.append('b')
        double_linked_list.delete_at_beginning

        expect(double_linked_list.head.data).to eq('b')
      end
    end
  end

  describe '#delete_at_end' do
    it 'should return deleted node' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.append('a')
      deleted_node = double_linked_list.delete_at_end

      expect(deleted_node.data).to eq('a')
    end

    context 'when just single node' do
      it 'should actually delete the tail node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.delete_at_end

        expect(double_linked_list.tail).to eq(nil)
      end

      it 'should actually delete the head node' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.delete_at_beginning

        expect(double_linked_list.head).to eq(nil)
      end
    end
    
    context 'when it contains more than one node' do
      it 'should change the previous node into new tail' do
        double_linked_list = DoubleLinkedList.new
        double_linked_list.append('a')
        double_linked_list.append('b')
        double_linked_list.delete_at_end

        expect(double_linked_list.tail.data).to eq('a')
      end
    end
  end

  # TODO: WIP
  describe '#insert' do
    xit 'should insert if linked list empty' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.insert_at(0, 'a')

      expect(double_linked_list.head.data).to eq('a')
    end

    xit 'should insert between two nodes' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.insert_at_beginning('a')
      double_linked_list.insert_at_end('b')
      double_linked_list.insert_at(1, 'x')

      expect(double_linked_list.head.next_node.data).to eq('x')
      expect(double_linked_list.tail.previous_node.data).to eq('x')
    end

    xit 'asd' do
      double_linked_list = DoubleLinkedList.new
      double_linked_list.insert_at(0, 'a')
      double_linked_list.insert_at(1, 'b')
      double_linked_list.insert_at(2, 'c')
      double_linked_list.insert_at(3, 'd')

      double_linked_list.print
      expect(double_linked_list.head.data).to eq('a')
      expect(double_linked_list.head.next_node.data).to eq('b')
      expect(double_linked_list.head.next_node.next_node.data).to eq('c')
      # expect(double_linked_list.head.next_node.next_node.next_node.data).to eq('d')
    end
  end
end
