class AddApprovedAndAdminToUser < ActiveRecord::Migration[5.0]
  # def change
  #   add_column :users, :approved, :boolean
  #
  # end
  def self.up
   add_column :users, :approved, :boolean, :default => false, :null => false
   add_index  :users, :approved
 end

 def self.down
   remove_index  :users, :approved
   remove_column :users, :approved
 end

end
