gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'

class IterativeLinkedListTest < Minitest::Test

  def Setup
    linked_list = IterativeLinkedList.new
  end

  def test_a_node_can_exist
    assert, node1 = Node.new
  end

  def test_a_node_can_have_data
    node1 = Node.new("this is some data")
    assert_equal "this is some data", node1.data
  end


  def test_nodes_have_a_next
    node1 = Node.new
    node2 = Node.new
    assert_equal node2 , node1.next_node_is(node2)
  end

  def test_nodes_start_with_nil_as_next_node
    node1 = Node.new
    assert_equal nil, node1.next_node
  end

  def test_lists_can_have_a_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    assert_equal node1, linked_list.head(node1)
  end

  def test_the_head_is_nil_when_the_list_is_empty
    linked_list = IterativeLinkedList.new
    assert_equal nil, linked_list.head?
  end

  def test_you_can_insert_a_node_into_an_empty_list
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    assert_equal node1, linked_list.head(node1)
  end

  def test_when_you_insert_a_node_into_an_empty_list_it_is_the_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    linked_list.head(node1)
    assert_equal node1, linked_list.head?
  end

  def test_when_nod_is_first_node_it_becomes_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    linked_list.append_node(node1)
    assert_equal node1, linked_list.head?
  end

  def test_when_a_second_node_is_added_the_first_points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    assert_equal node2, node1.next_node
  end

  def test_there_is_a_tail_of_the_list_with_nil_as_next_node
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    assert_equal true, node2.tail?
  end

  def test_when_a_third_node_is_added_the_second_Points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    node3 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    assert_equal node3, node2.next_node
  end

  def test_when_a_fourth_node_is_added_the_third_Points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    node3 = Node.new
    node4 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node4, node3.next_node
  end

  def test_it_can_count_its_elements
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    node3 = Node.new
    node4 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal 4, linked_list.count
  end

  def test_it_can_access_the_tail
    linked_list = IterativeLinkedList.new
    node1 = Node.new
    node2 = Node.new
    node3 = Node.new
    node4 = Node.new
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node4, linked_list.tail
  end



end
