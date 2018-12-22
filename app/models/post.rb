class Post < ApplicationRecord
  belongs_to :admin_user

  validates_presence_of :title, :text, :admin_user
  validate :author_not_changed
  scope :owned, ->(user) { where(admin_user: user) }

  private

  def author_not_changed
    if admin_user.present? && admin_user.changed? && self.persisted?
      errors.add(:author_id, 'Author can not be changed.')
    end
  end

end