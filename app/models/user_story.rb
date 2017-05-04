class UserStory < ApplicationRecord

  # Relacionamentos
  has_many :user_story_acceptance_criterions
  belongs_to :theme
end
