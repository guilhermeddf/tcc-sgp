class AddUsernamegitAndPasswordgitToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :usernamegit, :string
  	add_column :users, :passwordgit, :string
  end

  def self.down
   remove_column :users, :usernamegit
   remove_column :users, :passwordgit
 end
end
