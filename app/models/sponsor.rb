class Sponsor < ActiveRecord::Base
  validate :fullname, presence: true

  has_many :dreams, through: :tasks
  has_many :tasks
end
