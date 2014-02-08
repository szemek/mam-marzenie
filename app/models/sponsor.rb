class Sponsor < ActiveRecord::Base
  validate :fullname, presence: true
end
