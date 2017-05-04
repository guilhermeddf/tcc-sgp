class CreateUserAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_abilities do |t|
      t.references :user, foreign_key: true, null: false
      t.references :ability, foreign_key: true, null: false

      t.timestamps
    end
  end
end
