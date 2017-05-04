class CreateUserStoryAcceptanceCriterions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_story_acceptance_criterions do |t|
      t.text :description
      t.integer :status, default: 0
      t.references :user_story, foreign_key: true

      t.timestamps
    end
  end
end
