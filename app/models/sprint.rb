class Sprint < ApplicationRecord
  belongs_to :project
  belongs_to :release
end
