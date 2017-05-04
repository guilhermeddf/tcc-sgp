class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Foto
  mount_uploader :avatar, AvatarUploader

  # Permissão de acesso ao sistema apenas quando administrador validar
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  # Relacionamentos
  belongs_to :local
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :function_user_projects
  has_many :projects, through: :function_user_projects
  has_many :functions, through: :function_user_projects

  accepts_nested_attributes_for :local, reject_if: :all_blank, allow_destroy: true
end
