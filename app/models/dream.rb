# Dream
class Dream < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members

  scope :updated_after, ->(date) { where('updated_at >= ?', date) }
end
