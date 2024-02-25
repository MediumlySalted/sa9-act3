require 'dll'

RSpec.describe DoubleLinkedList do
  test = DoubleLinkedList.new
  describe '#append' do
    it 'Successfully appends data when empty' do
      test.append Node.new(1)
      expect(test.head.data).to eq 1
      expect(test.tail.data).to eq 1
    end

    it 'Successfully appends data ontop of data' do
      test.append Node.new(2)
      test.append Node.new(3)
      expect(test.head.data).to eq 1
      expect(test.head.next.data).to eq 2
      expect(test.tail.data).to eq 3
      expect(test.tail.prev.data).to eq 2
    end
  end

  describe '#insert' do
    it 'Successfully inserts data to the head' do
      test.insert 0, Node.new(0)
      expect(test.head.data).to eq 0
      test.insert 0, Node.new(-1)
      expect(test.head.data).to eq -1
    end

    it 'Successfully inserts data to the middle' do
      test.insert 1, Node.new(10)
      expect(test.head.next.data).to eq 10
    end
  end

  describe '#delete' do
    it 'Successfully deletes data from the front' do
      test.delete 0
      expect(test.head.data).to eq 10
    end

    it 'Successfully deletes data from the middle' do
      test.delete 1
      expect(test.head.next.data).to eq 0
    end

    it 'Successfully deletes data from the end' do
      test.delete 4
      expect(test.tail.data).to eq 3
    end
  end
end
