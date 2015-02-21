class IterativeLinkedList

  attr_accessor :head, :tail, :count

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

  def append_node_front(node)
    node.next_node_is(@head)
    @head = node
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

  def pop_tail
    current = @head
    until current.next_node.next_node == nil
      current = current.next_node
    end
    current.next_node_is(nil)
  end

  def pop_head
    @head = @head.next_node
  end

  def access_node(number)
    if number == 1
      @head
    else
      current = @head
      number -= 1
      while number > 0
        if current.next_node == nil
           current = "ERROR: no-node-land"
           number = 0
        else
          current = current.next_node
          number -= 1
        end
      end
       current
    end
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
node1 = Node.new("a")
node2 = Node.new("b")
node3 = Node.new("c")
node4 = Node.new("d")


list.append_node(node1)
list.append_node(node2)
list.append_node(node3)
list.append_node(node4)

# puts list.head?.data
# puts list.head?.next_node.data
# list.pop_head
# puts list.head?.data
# puts list.head?.next_node.data
