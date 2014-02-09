# Dream
class Dream < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members
  has_many :tasks
  belongs_to :sponsors

  scope :updated_after, ->(date) { where('updated_at >= ?', date) }

  validates_presence_of :title, :description, :child_fullname, :region, :category
  validates :child_age, inclusion: { in: proc { age_range } }
  validates :status, inclusion: { in: proc { statuses } }

  mount_uploader :avatar, AvatarUploader

  def self.age_range
    3..18
  end

  def self.categories_collection
    [:have, :meet, :travel, :be, :other].map do |item|
      [I18n.t(item), item]
    end
  end

  def self.statuses
    %w[ongoing completed failed]
  end
end
