class IterativeLinkedList

  attr_accessor :head
  attr_reader :count, :tail

  def initialize(head=nil)
    @head = head
  end

  def head(node)
    @head = node
  end

  def head?
    @head
  end

  def append_node(node)
    if @head == nil
      @head = node
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node_is(node)
    end
  end

  def count
    @count = 0
    current = @head
    while current.next_node != nil
      @count +=1
      current = current.next_node
    end
    @count += 1
  end

  def tail
    current = @head
    while current.next_node != nil
      current = current.next_node
      if current.tail?
        @tail = current
      end
    end
    @tail
  end

end


class Node

  attr_accessor :data, :next_node

  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end

  def next_node_is(node)
    @next_node = node
  end

  def next_node
    @next_node
  end

  def tail?
    next_node == nil ? true : false
  end

end

list = IterativeLinkedList.new
node1 = Node.new
node2 = Node.new
node3 = Node.new


list.append_node(node1)
list.append_node(node2)
list.append_node(node3)
