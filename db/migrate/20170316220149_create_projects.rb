class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :size, default: 0, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :local, foreign_key: true

      t.timestamps
    end
  end
end
