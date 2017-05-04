json.extract! user_story, :id, :description, :business_value, :status, :story_points, :theme_id, :created_at, :updated_at
json.url user_story_url(user_story, format: :json)
