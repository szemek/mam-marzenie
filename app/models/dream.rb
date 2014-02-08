# Dream
class Dream < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members
end
