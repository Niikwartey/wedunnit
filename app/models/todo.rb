class Todo < ActiveRecord::Base
  belongs_to :user

  def self.all_done
    Todo.all.select {|todo|  todo.is_done == true }
  end

  def self.all_pending
    Todo.all.select {|todo|  todo.is_done == false }
  end

  def done
    update(is_done: true)
  end

  def undone
    update(is_done: false)
  end
end