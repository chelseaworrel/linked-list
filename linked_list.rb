

class IterativeLinkedList

  attr_accessor :head

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
      @head.next_node(node)
    end
  end

end


class Node

  attr_accessor :data, :next_node
  attr_reader

  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end

  def next_node(node)
    @next_node = node
  end

  def next_node?
    @next_node
  end

end

list = IterativeLinkedList.new
node1 = Node.new
node2 = Node.new

list.append_node(node1)
list.append_node(node2)
