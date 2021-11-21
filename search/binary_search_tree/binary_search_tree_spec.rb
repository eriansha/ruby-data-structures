 require 'rspec'
require_relative 'binary_search_tree'

describe 'BinarySearchTree' do
  it 'should return nil when first initialize' do
    bst = BinarySearchTree.new
    expect(bst.root).to eq(nil)
  end

  describe '#insert' do
    it 'should return 1 after inserting 1' do
      bst = BinarySearchTree.new
      bst.insert(1)
      expect(bst.root.value).to eq(1)
    end

    it 'should add value to left node when adding lower value than root' do
      bst = BinarySearchTree.new
      bst.insert(2)
      bst.insert(1)
      expect(bst.root.left.value).to eq(1)
    end

    it 'should add value to right node when adding bigger value than root' do
      bst = BinarySearchTree.new
      bst.insert(1)
      bst.insert(2)
      expect(bst.root.right.value).to eq(2)
    end

    it 'should add value to left grandchild node when adding value smaller than ancestor node' do
      bst = BinarySearchTree.new
      bst.insert(3)
      bst.insert(2)
      bst.insert(1)
      expect(bst.root.left.left.value).to eq(1)
    end

    it 'should add value to right grandchild node when adding value bigger than ancestor node' do
      bst = BinarySearchTree.new
      bst.insert(1)
      bst.insert(2)
      bst.insert(3)
      expect(bst.root.right.right.value).to eq(3)
    end
  end

  describe '#find' do
    it 'shoudl find root node' do
      value = 1
      bst = BinarySearchTree.new
      bst.insert(value)
      node = bst.find(value)

      expect(node.value).to eq(value)
    end

    it 'should find left node' do
      bst = BinarySearchTree.new
      bst.insert(3)
      bst.insert(2)
      bst.insert(1)
      node = bst.find(1)

      expect(node.value).to eq(1)
    end

    it 'should find right node' do
      bst = BinarySearchTree.new
      bst.insert(3)
      bst.insert(4)
      bst.insert(5)
      node = bst.find(5)

      expect(node.value).to eq(5)
    end
  end

  describe '#delete' do
    it 'should return nil when deleting any value in empty tree' do
      bst = BinarySearchTree.new
      expect(bst.delete(1)).to eq(nil)
    end

    context 'when deleting root node' do
      it 'should return root node' do
        bst = BinarySearchTree.new
        bst.insert(1)
        deleted_node = bst.delete(1)
        expect(deleted_node.value).to eq(1)
      end

      it 'should actually delete node the root node' do
        bst = BinarySearchTree.new
        bst.insert(1)
        bst.delete(1)
        expect(bst.root).to eq(nil)
      end
    end

    context 'when deleting leaf child node' do
      context 'without grandchild node' do
        it 'should return left child node' do
          bst = BinarySearchTree.new
          bst.insert(2)
          bst.insert(1)
          deleted_node = bst.delete(1)

          expect(deleted_node.value).to eq(1)
        end

        it 'should actually delete the left child node' do
          bst = BinarySearchTree.new
          bst.insert(2)
          bst.insert(1)
          bst.delete(1)

          expect(bst.root.left).to eq(nil)
        end

        it 'should return right child node' do
          bst = BinarySearchTree.new
          bst.insert(1)
          bst.insert(2)
          deleted_node = bst.delete(2)

          expect(deleted_node.value).to eq(2)
        end

        it 'should actually delete the left child node' do
          bst = BinarySearchTree.new
          bst.insert(1)
          bst.insert(2)
          bst.delete(2)

          expect(bst.root.right).to eq(nil)
        end
      end

      context 'with one child node' do
        it 'should ensure left grandchild node become the new left child node' do
          bst = BinarySearchTree.new
          bst.insert(3)
          bst.insert(2)
          bst.insert(1)
          bst.delete(2)

          expect(bst.root.left.value).to eq(1)
        end

        it 'should ensure right grandchild node become the new left child node' do
          bst = BinarySearchTree.new
          bst.insert(3)
          bst.insert(1)
          bst.insert(2)
          bst.delete(1)

          expect(bst.root.left.value).to eq(2)
        end

        it 'should ensure left grandchild node become the new right child node' do
          bst = BinarySearchTree.new
          bst.insert(1)
          bst.insert(3)
          bst.insert(2)
          bst.delete(3)

          expect(bst.root.right.value).to eq(2)
        end

        it 'should ensure right grandchild node become the new right child node' do
          bst = BinarySearchTree.new
          bst.insert(1)
          bst.insert(2)
          bst.insert(3)
          bst.delete(2)

          expect(bst.root.right.value).to eq(3)
        end
      end

      context 'with two child' do
        it 'should ensure left-most node of the right subtree become the new left child node' do
          bst = BinarySearchTree.new
          bst.insert(4)
          bst.insert(2)
          bst.insert(5)
          bst.insert(1)
          bst.insert(3)
          bst.delete(2)

          expect(bst.root.left.value).to eq(3)
        end
      end
    end
  end
end
