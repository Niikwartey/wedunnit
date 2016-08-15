class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.boolean :is_done
      t.integer :user_id
    end
  end
end
