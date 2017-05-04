class Ability < ApplicationRecord

  def self.available
    Ability.all
  end
  # Relacionamentos
  belongs_to :project, foreign_key: "scope",class_name: 'Project'
end
