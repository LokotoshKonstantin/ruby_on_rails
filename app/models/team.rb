class Team < ApplicationRecord
  validates_presence_of :name
  has_many :admin_users
  has_many :projects

  mount_uploader :photo, PhotoUploader
end