class FunctionUserProject < ApplicationRecord

  def self.available_user_for project
    # list_user_project = FunctionUserProject.joins(:user,:project).where.not project: project
    User.all - Project.find(project).users
  end

  # Validates
  validates :project_id, presence: true
  validates :function_id, presence: true
  validates :user_id, presence: true

  # Relacionamentos
  belongs_to :project
  belongs_to :function
  belongs_to :user
end
