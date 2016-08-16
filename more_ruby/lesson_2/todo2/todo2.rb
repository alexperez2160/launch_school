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
    if num > (todos.size - 1) 
      raise IndexError
    else todos.delete_at(num)
    end 
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
  
  def all_not_done
    self.select { |todo| todo.done == false}
  end 
  
  def mark_done(str)
    find_by_title(str).each {|todo| todo.done!}
  end 
  
  def done!
    self.each { |todo| todo.done!}
  end 
  
  def mark_all_undone
    self.each { |todo| todo.undone!}
  end 
  
  def to_a
    todos
  end 
  
  def first 
    todos.first
  end
  
  def last 
    todos.last
  end 
  
  def shift 
    first_todo = self.first
    self.remove_at(0)
    first_todo
  end 
  
  def pop
    last_todo = self.last 
    self.remove_at(self.size-1)
    last_todo
  end 
  
  def done?
    result = []
    self.each do |todo|
      result.push(todo.done?)
    end
    result.count(true)== self.size
  end 

end   

mystuff = TodoList.new("August 16")

puts mystuff.to_s