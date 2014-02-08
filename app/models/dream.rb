# Dream
class Dream < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members

  validates_presence_of :title, :description, :child_fullname, :region
  validates :child_age, inclusion: { in: proc { age_range } }
  validates :status, inclusion: { in: proc { statuses } }

  mount_uploader :avatar, AvatarUploader

  def self.age_range
    3..18
  end

  def self.statuses
    ['ongoing', 'completed', 'failed']
  end
end
