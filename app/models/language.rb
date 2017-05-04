class Language < ApplicationRecord
  def self.available_for_user user
    Language.all - user.languages 
  end
end
