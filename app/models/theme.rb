class Theme < ApplicationRecord
  # Relacionamentos
  belongs_to :project
  has_many :user_stories
end
