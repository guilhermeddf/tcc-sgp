class TaskRequirement < ApplicationRecord
  belongs_to :task
  belongs_to :ability
end
