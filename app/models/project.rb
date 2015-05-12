class Project < ActiveRecord::Base
  has_many :pledges, through: :rewards
  has_many :rewards
  belongs_to :user
end
