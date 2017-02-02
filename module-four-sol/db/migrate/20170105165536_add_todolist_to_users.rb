class AddTodolistToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :TodoList, index: true, foreign_key: true
  end
end
