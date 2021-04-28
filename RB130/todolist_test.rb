require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
    assert_equal(nil, @list.find_by_title('Sail the 7 seas'))
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.length, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    # tests for correct return value.
    
    assert_equal(2, @list.size)
    # tests that list is 1 item shorter
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(true, @list.each { |todo| todo.done! }.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(3) }
    # can add more tests with diff types just to be extra safe
  end

  def test_shovel
    todo4 = Todo.new('Do homework')
    assert_equal(todo4, (@list << todo4).last)
    assert_equal(Todo, (@list << todo4).last.class)
  end

  def test_add
    test_shovel
  end

  def test_item_at
    i = (0..@list.size-1).to_a.sample
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_raises(IndexError) { @list.item_at(-(@list.size) - 1) }
    assert_equal(@todos[i], @list.item_at(i))
  end

  def test_mark_done_at
    i = (0..@list.size-1).to_a.sample
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_raises(IndexError) { @list.item_at(-(@list.size) - 1) }
    assert_equal(@todos[i], @list.item_at(i))
    assert_equal(true, @list.mark_done_at(i))
    assert_equal(true, @todos[i].done?)
  end

  def test_mark_undone_at
    i = (0..@list.size-1).to_a.sample
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_raises(IndexError) { @list.item_at(-(@list.size) - 1) }
    assert_equal(@todos[i], @list.item_at(i))
    assert_equal(false, @list.mark_undone_at(i))
    assert_equal(false, @todos[i].done?)
  end

  def test_done!
    assert_equal(true, @list.done!.all? { |todo| todo.done? == true })
  end

  def test_remove_at
    i = (0..@list.size-1).to_a.sample
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_raises(IndexError) { @list.item_at(-(@list.size) - 1) }
    assert_equal(@todos[i], @list.item_at(i))
    assert_equal(@todos[i], @list.remove_at(i))
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_todo_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_todos_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iter
    todos = []
    @list.each { |todo| todos << todo }
    assert_equal(@todos, todos)
  end

  def test_each_return
    assert_equal(@list, @list.each { |todo| todo })
  end

  def test_select
    assert_equal(TodoList, @list.select { |todo| todo }.class)
    assert_equal(true, @list != @list.select { |todo| todo })
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end
end