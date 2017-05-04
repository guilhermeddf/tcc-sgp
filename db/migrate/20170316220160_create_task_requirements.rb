class CreateTaskRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :task_requirements do |t|
      t.references :task, foreign_key: true, null: false
      t.references :ability, foreign_key: true, null: false
      t.integer :level, default: 0, null: false

      t.timestamps
    end
  end
end
