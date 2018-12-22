class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  ADMIN_ROLE = 'admin'
  AUTHOR_ROLE = 'author'
  ROLES = [ADMIN_ROLE,AUTHOR_ROLE]
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  has_one :team
  has_many :projects, through: :team
  validates :role, inclusion: { in: ROLES, message:'Undefined role'}

end