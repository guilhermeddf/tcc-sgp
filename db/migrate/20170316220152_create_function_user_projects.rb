class CreateFunctionUserProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :function_user_projects do |t|
      t.references :project, foreign_key: true, null: false
      t.references :function, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
