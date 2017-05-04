class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.date :end_date, null: false
      t.integer :status, default: 0
      t.references :user_story, foreign_key: true, null: false

      t.timestamps
    end
  end
end
