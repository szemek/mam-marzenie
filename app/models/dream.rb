# Dream
class Dream < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members

  validates :child_age, inclusion: { in: proc { |obj| obj.age_range } }

  def age_range
    3..18
  end
end
