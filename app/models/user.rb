class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  has_many :owned_projects, class_name: "Project"
  has_many :backed_projects, through: :pledges, class_name: "Project"
  has_many :pledges
end
