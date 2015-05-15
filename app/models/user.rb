class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :first_name, :last_name, :email, :password, presence: true
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
<<<<<<< HEAD
=======

>>>>>>> 013f12e77433220b938135688ded4e0b26f392e9
  has_many :owned_projects, class_name: "Project"
  has_many :backed_projects, through: :pledges, class_name: "Project"
  has_many :pledges

  validates :password, length: { minimum: 7 }
  validates :email, uniqueness: true
end
