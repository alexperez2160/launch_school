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
end

class TodoList
  attr_accessor :title, :todos
  
  def initialize(title)
    @title = title
    @todos = []
  end
  
  def <<(todo_to_add)
    if  todo_to_add.class == Todo
      @todos.push(todo_to_add)
    else 
      raise TypeError, "Can only add todos"
    end 
  end 
  alias_method :add, :<<
  
  def size 
    todos.size 
  end 
  
  def last 
    todos.last 
  end 
  
  def item_at(num)
    todos.fetch(num)
  end 
  
  def mark_done_at(num)
    todos.fetch(num).done!
  end 
  
  def mark_undone_at(num)
    todos.fetch(num).undone!
  end 
  
  def shift 
    todos.shift
  end 
  
  def pop
    todos.pop
  end 
  
  def remove_at(num)
    todos.delete_at(num)
  end 
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(title)
    todos.each do |todo|
      result.todos << todo if yield(todo)
    end 
    result
  end 
  
  def find_by_title(str)
    select { |todo| todo.title == str}
  end
  
  def all_done
    self.select { |todo| todo.done}
  end 
  
  def all_not_done
    self.select { |todo| todo.done == false}
  end 
  
  def mark_done(str)
    find_by_title(str).each {|todo| todo.done!}
  end 
  
  def mark_all_done
    self.each { |todo| todo.done!}
  end 
  
  def mark_all_undone
    self.each { |todo| todo.undone!}
  end 
end   

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!


puts list.mark_done("Clean room")