class Release < ApplicationRecord

  def self.from_project project
    Release.where project: project
  end
  
  # Relacionamentos
  belongs_to :project
end
