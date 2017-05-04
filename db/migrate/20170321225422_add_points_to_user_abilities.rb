class AddPointsToUserAbilities < ActiveRecord::Migration[5.0]
  def change
    add_column :user_abilities, :points, :integer, default: 0
  end
end
