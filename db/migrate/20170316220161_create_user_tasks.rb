class CreateUserTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :task, foreign_key: true, null: false

      t.timestamps
    end
  end
end
