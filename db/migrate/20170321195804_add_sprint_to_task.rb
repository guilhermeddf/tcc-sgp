class AddSprintToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :sprint, foreign_key: true
  end
end
