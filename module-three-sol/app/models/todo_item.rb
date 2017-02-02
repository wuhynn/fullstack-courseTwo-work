class TodoItem < ActiveRecord::Base
  def self.count_completed_todos
    TodoItem.where(completed:true).count
  end
end
