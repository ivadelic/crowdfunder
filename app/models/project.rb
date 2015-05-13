class Project < ActiveRecord::Base
  has_many :pledges, through: :rewards
  has_many :rewards
  belongs_to :user

  accepts_nested_attributes_for :rewards, allow_destroy: true
end
