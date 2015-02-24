
class IterativeLinkedList

  attr_reader :head

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

  def remove(data)
    current = @head
    if tail.data == data
      pop_tail
    else
      while current.next_node != nil
        current = current.next_node
        if current.next_node == nil
          current.next_node_is(nil)
        else
          current.next_node.data == data
          new_next = current.next_node.next_node
          current.next_node_is(new_next)
         end
      end
      current.next_node
    end
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
    current.next_node.next_node
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

  def remove_position(number)
    if number == 1
      pop_head
    else
      number -= 2
      current = @head
      while number > 0
        current = current.next_node
        number -= 1
      end
      new_next = current.next_node.next_node
      current.next_node_is(new_next)
    end
  end

  def append_node_postion(node, number)
    if number == 1
      append_node_front(node)
    else
      number -= 2
      current = @head
      while number > 0
        if current.next_node == nil
          "error"
          number == 0
        else
          current = current.next_node
          number -= 1
        end
      end
      current
      node.next_node_is(current.next_node.next_node)
      current.next_node_is(node)
    end
  end

  def append_node_after(new_node, before_node)
    current = @head
    until current == before_node
      current = current.next_node
    end
    new_node.next_node_is(current.next_node)
    current.next_node_is(new_node)
  end

  def contain?(data)
    current = @head
    until current.next_node == nil
      current = current.next_node
      if current.data == data
        @exist = true
        break
      else
        @exist = false
      end
    end
    @exist
  end

  def distance(node1, node2)
    current = @head
    until current.next_node == nil
      current = current.next_node
      if current == node1
        @node_spaces = 0
        @node_spaces += 1
      elsif current == node2
        break
      else
        @node_spaces += 1
      end
    end
    @node_spaces
  end

end


class Node

  attr_accessor :next_node
  attr_reader :data

  def initialize(data, next_node=nil)
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

class RecursiveLinkedList

  attr_reader :r_head, :r_tail, :r_count

  def initialize(head=nil)
    @r_head = head
    @r_count = 0
  end

  def r_head(node)
    @r_head = node
  end

  def r_head?
    @r_head
  end

  def r_append_node(node_append, node=@r_head)
    if node == nil
      @r_head = node_append
    elsif node.next_node
        r_append_node(node_append, node.next_node)
    else
      node.next_node_is(node_append)
    end
  end

  def r_count(node=@r_head)
    if node.next_node == nil
      @r_count += 1
    else
      node.next_node
      @r_count += 1
      r_count(node.next_node)
    end
  end

  def r_tail(node=@r_head)
    if node.next_node == nil
      @r_tail = node
    else
      node.next_node
      r_tail(node.next_node)
    end
  end

    def r_pop_tail(node=@r_head)
      if node.next_node.next_node == nil
        node.next_node
        node.next_node = nil
      else
        node.next_node
        r_pop_tail(node.next_node)
      end
    end

    def r_access_node(number, node=@r_head)
      if number == 1
        node
      elsif node.next_node == nil
        @r_tail
      else
        number -= 1
        node.next_node
        r_access_node(number, node.next_node)
      end
    end

    def r_pop_head(node=@r_head)
      @r_head = node.next_node
    end

    def r_append_node_front(new_node)
      new_node.next_node_is(@r_head)
      @r_head = new_node
    end

    def r_remove(data, node=@r_head)
      if node.next_node.data == data
        node.next_node_is(node.next_node.next_node)
        node.next_node.next_node_is(nil)
      else
        node.next_node
        r_remove(data, node.next_node)
      end
    end

    def r_append_node_position(new_node, number, node=@r_head)
      if number == 2
        new_node.next_node_is(node.next_node)
        node.next_node_is(new_node)
      elsif number == 1
        r_append_node_front(new_node)
      else
        number -=1
        node.next_node
        r_append_node_position(new_node, number, node.next_node)
      end
    end


    def r_append_node_after(new_node, previous_node, node=@r_head)

    end

end

linked_list = IterativeLinkedList.new
node1 = Node.new("a")
node2 = Node.new("b")
node3 = Node.new("c")
node4 = Node.new("d")
linked_list.append_node(node1)
linked_list.append_node(node2)
linked_list.append_node(node3)
linked_list.append_node(node4)
linked_list.remove("d")
linked_list.tail
