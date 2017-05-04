class CreateUserStories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_stories do |t|
      t.text :description
      t.integer :business_value, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.integer :story_points, default: 0, null: false
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
