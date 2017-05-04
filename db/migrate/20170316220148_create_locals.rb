class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
