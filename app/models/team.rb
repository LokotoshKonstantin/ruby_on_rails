class Team < ApplicationRecord
  has_many :admin_users 
  has_many :projects
end