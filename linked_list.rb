
# class LinkedList
#
#   attr_accessor :head, :tail
#
#   def initialize(head=nil)
#     @head = head
#   end
#
#   def head(node)
#     @head = node
#   end
#
#   def head?
#     @head
#   end
#
# end




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

  def remove(data)
    current = @head
    while current.next_node != nil

      current = current.next_node
      if current.next_node == nil
        "error"
      else
        current.next_node.data == data
        new_next = current.next_node.next_node
        current.next_node_is(new_next)
      end
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

end


class Node

  attr_accessor :data, :next_node

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

  attr_accessor :r_head, :tail, :count

  def initialize(head=nil)
    @r_head = head
  end

  def r_head(node)
    @r_head = node
  end

  def r_head?
    @r_head
  end

  def r_append_node(node)
    if @r_head == nil
      @r_head = node
    else
      current = @head
      return if current.next_node == nil
          current = current.next_node
          current.next_node_is(node)
      end
  end

  def r_head?
    @r_head
  end

end
