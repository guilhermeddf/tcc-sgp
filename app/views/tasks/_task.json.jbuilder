json.extract! task, :id, :description, :end_date, :status, :user_story_id, :created_at, :updated_at
json.url task_url(task, format: :json)
