gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'

#ask about my variables being weird @head can't print,

#add the popped nodes in so they are returned


class IterativeLinkedListTest < Minitest::Test

  def Setup
    linked_list = IterativeLinkedList.new
  end

  def test_a_node_can_exist
    assert, node1 = Node.new("a")
  end

  def test_a_node_can_have_data
    node1 = Node.new("this is some data")
    assert_equal "this is some data", node1.data
  end


  def test_nodes_have_a_next
    node1 = Node.new("a")
    node2 = Node.new("b")
    assert_equal node2 , node1.next_node_is(node2)
  end

  def test_nodes_start_with_nil_as_next_node
    node1 = Node.new("a")
    assert_equal nil, node1.next_node
  end

  def test_lists_can_have_a_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    assert_equal node1, linked_list.head(node1)
  end

  def test_the_head_is_nil_when_the_list_is_empty
    linked_list = IterativeLinkedList.new
    assert_equal nil, linked_list.head?
  end

  def test_you_can_insert_a_node_into_an_empty_list
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    assert_equal node1, linked_list.head(node1)
  end

  def test_when_you_insert_a_node_into_an_empty_list_it_is_the_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    linked_list.head(node1)
    assert_equal node1, linked_list.head?
  end

  def test_when_nod_is_first_node_it_becomes_head
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    linked_list.append_node(node1)
    assert_equal node1, linked_list.head?
  end

  def test_when_a_second_node_is_added_the_first_points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    assert_equal node2, node1.next_node
  end

  def test_there_is_a_tail_of_the_list_with_nil_as_next_node
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    assert_equal true, node2.tail?
  end

  def test_when_a_third_node_is_added_the_second_Points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    assert_equal node3, node2.next_node
  end

  def test_when_a_fourth_node_is_added_the_third_Points_to_it
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node4, node3.next_node
  end

  def test_it_can_count_its_elements
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal 4, linked_list.count
  end

  def test_it_can_access_the_tail
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node4, linked_list.tail
  end

  def test_it_can_remove_the_last_node
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.pop_tail
    assert_equal node3, linked_list.tail
  end

  def test_it_can_acces_node_by_number
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node3, linked_list.access_node(3)
  end

  def test_it_can_access_the_head_if_given_1
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node1, linked_list.access_node(1)
  end

  def test_it_wont_break_if_given_a_number_beyond_the_tail
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal "ERROR: no-node-land", linked_list.access_node(5)
  end

  def test_it_can_pop_the_head_node
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.pop_head
    assert_equal node2, linked_list.head?
  end

  def test_it_can_push_a_node_onto_the_front
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node_front(node4)
    assert_equal node4, linked_list.head?
  end

  def test_it_can_remove_a_node_by_its_data
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.remove("c")
    assert_equal 3, linked_list.count
  end

  def test_when_a_node_is_removed_the_previous_node_now_points_to_its_next
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.remove("c")
    assert_equal node4, node2.next_node
  end

  def test_it_can_remove_the_tail_with_remove
    skip
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
    assert_equal node3, linked_list.tail
  end

  #need to make remove able to remove head or tail based on data(without errors)

  def test_it_can_remove_a_node_based_on_position
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.remove_position(3)
    assert_equal node4, node2.next_node
  end

  def test_it_can_remove_a_node_based_on_position_again
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.remove_position(2)
    assert_equal node3, node1.next_node
  end

  def test_it_can_insert_a_node_at_a_specified_position
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)

    linked_list.append_node_postion(node4, 2)
    assert_equal node4, node1.next_node
  end

  def test_it_can_insert_a_node_at_a_specified_position_again
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)

    linked_list.append_node_postion(node4, 3)
    assert_equal node4, node2.next_node
  end

  def test_it_becomes_the_head_when_it_gets_appended_to_the_first_position
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)

    linked_list.append_node_postion(node4, 1)
    assert_equal node1, node4.next_node
  end

  def test_it_can_add_an_node_after_a_known_node
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node4)
    linked_list.append_node_after(node4, node2)
    assert_equal node4, node2.next_node
  end

  def test_it_can_return_true_if_specific_data_is_contained_in_the_list
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    assert_equal true, linked_list.contain?("b")
  end

  def test_it_can_return_false_if_specific_data_is_not_contained_in_the_list
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    assert_equal false, linked_list.contain?("d")
  end

  def test_it_can_find_the_distance_between_two_nodes
    linked_list = IterativeLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    node5 = Node.new("e")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.append_node(node5)

    assert_equal 2, linked_list.distance(node2, node4)
    assert_equal 3, linked_list.distance(node2, node5)
  end




end

class RecursiveLinkedListTest < Minitest::Test

  def test_the_head_is_nil_when_the_list_is_empty
    linked_list = RecursiveLinkedList.new
    assert_equal nil, linked_list.r_head?
  end

  def test_you_can_insert_a_node_into_an_empty_list
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    assert_equal node1, linked_list.r_head(node1)
  end

  def test_when_you_insert_a_node_into_an_empty_list_it_is_the_head
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    linked_list.r_head(node1)
    assert_equal node1, linked_list.r_head?
  end

  def test_when_nod_is_first_node_it_becomes_head
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    linked_list.r_append_node(node1)
    assert_equal node1, linked_list.r_head?
  end

  def test_when_a_second_node_is_added_the_first_points_to_it
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    assert_equal node2, node1.next_node
  end

  def test_when_a_third_node_is_added_the_second_points_to_it
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    linked_list.r_append_node(node3)
    assert_equal node3, node2.next_node
  end

  def test_there_is_a_tail_of_the_list_with_nil_as_next_node
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    assert_equal true, node2.tail?
  end

  def test_when_a_fourth_node_is_added_the_third_Points_to_it
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    linked_list.r_append_node(node3)
    linked_list.r_append_node(node4)
    assert_equal node4, node3.next_node
  end

  def test_it_can_count_its_elements
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    linked_list.r_append_node(node3)
    linked_list.r_append_node(node4)
    assert_equal 4, linked_list.r_count
  end

  def test_it_can_access_the_tail
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    linked_list.r_append_node(node3)
    linked_list.r_append_node(node4)
    assert_equal node4, linked_list.r_tail
  end

  def test_it_can_remove_the_last_node
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.r_append_node(node1)
    linked_list.r_append_node(node2)
    linked_list.r_append_node(node3)
    linked_list.r_append_node(node4)
    linked_list.r_pop_tail
    assert_equal node3, linked_list.r_tail
  end

  def test_it_can_acces_node_by_number
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node3, linked_list.access_node(3)
  end

  def test_it_can_access_the_head_if_given_1
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal node1, linked_list.access_node(1)
  end

  def test_it_wont_break_if_given_a_number_beyond_the_tail
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    assert_equal "ERROR: no-node-land", linked_list.access_node(5)
  end

  def test_it_can_pop_the_head_node
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.pop_head
    assert_equal node2, linked_list.head?
  end

  def test_it_can_push_a_node_onto_the_front
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node_front(node4)
    assert_equal node4, linked_list.head?
  end

  def test_it_can_remove_a_node_by_its_data
    skip
    linked_list = RecursiveLinkedList.new
    node1 = Node.new("a")
    node2 = Node.new("b")
    node3 = Node.new("c")
    node4 = Node.new("d")
    linked_list.append_node(node1)
    linked_list.append_node(node2)
    linked_list.append_node(node3)
    linked_list.append_node(node4)
    linked_list.remove("c")
    assert_equal 3, linked_list.count
  end




end
