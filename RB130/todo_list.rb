# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def each
    iter = 0

    while iter < todos.size
      yield(todos[iter])

      iter += 1
    end

    self
  end

  def select
    sel_todos = TodoList.new(title)

    each do |todo|
      sel_todos.add(todo) if yield(todo)
    end

    sel_todos
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  def mark_done(title)
    todo = find_by_title(title)
    todo ? todo.done! : nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def find_by_title(title)
    matches = []
    each do |todo|
      matches << todo if todo.title == title
    end

    matches.empty? ? nil : matches[0]
  end

  def add(todo_obj)
    if todo_obj.instance_of? Todo
      todos << todo_obj
    else
      raise TypeError, "Can only add Todo objects"
    end
    
    todos
  end
  alias_method :<<, :add

  # since :add and :<< behave the same we can define one of them and alias the other

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    raise IndexError if index >= todos.size
    raise IndexError if index < -todos.size
    todos[index]
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError if index >= todos.size
    todos.delete_at(index)
  end

  def to_s
    str = "---- Today's Todos ----"
    todos.each { |todo| str << "\n#{todo}" }
    str
  end

  private
  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

puts list