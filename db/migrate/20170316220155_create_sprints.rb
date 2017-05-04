class CreateSprints < ActiveRecord::Migration[5.0]
  def change
    create_table :sprints do |t|
      t.references :project, foreign_key: true, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.date :planning_start_date, null: false
      t.date :planning_end_date, null: false
      t.date :execution_start_date, null: false
      t.date :execution_end_date, null: false
      t.date :review_meeting_date, null: false
      t.date :retrospective_meeting_date, null: false
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
