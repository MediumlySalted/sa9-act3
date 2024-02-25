
class Node
  attr_accessor :data, :next, :prev
  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end

  def to_s
    if @next == nil
      "#{@data}"
    else
      "#{@data}, #{@next}"
    end
  end

end


class DoubleLinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    if @head == nil
      @head = data
      @tail = data
    else
      @tail.next = data
      data.prev = @tail
      @tail = data
    end
  end

  def insert pos, data
    current_node = @head
    pos.times do
      current_node = current_node.next
    end

    if current_node.equal? @head
      next_node = current_node
      data.next = next_node
      @head = data
      data.next.prev = data


    else
      next_node = current_node
      prev_node = current_node.prev
      prev_node.next = data
      data.next = next_node
      data.prev = prev_node

    end

    def delete(pos)
      current_node = @head
      pos.times do
        current_node = current_node.next
      end

      if current_node.equal?(@head)
        @head = current_node.next
        current_node.next.prev = nil
      elsif current_node.equal?(@tail)
        current_node.prev.next = nil
      else
        next_node = current_node.next
        prev_node = current_node.prev
        prev_node.next = next_node
        next_node.prev = prev_node
      end
    end

  end

  def to_s
    "DoubleLinkedList(#{@head})"
  end

end

# test_list = DoubleLinkedList.new

# test_list.append(Node.new(1))
# test_list.append(Node.new(2))
# test_list.append(Node.new(3))

# puts test_list
# test_list.insert 1, Node.new(5)
# puts test_list
# test_list.delete(2)
# puts test_list
