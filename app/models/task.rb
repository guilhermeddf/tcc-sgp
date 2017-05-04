class Task < ApplicationRecord

  # Relacionamentos
  belongs_to :sprint
  belongs_to :user_story
end
