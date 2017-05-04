class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :version, null: false
      t.date :deliver_date, null: false
      t.references :project, foreign_key: true, null: false

      t.timestamps
    end
  end
end
