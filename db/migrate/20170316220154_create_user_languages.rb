class CreateUserLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_languages do |t|
      t.references :language, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
