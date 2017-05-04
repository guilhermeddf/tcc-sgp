class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
