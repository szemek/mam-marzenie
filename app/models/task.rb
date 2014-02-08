class Task < ActiveRecord::Base
  belongs_to :dream
  belongs_to :sponsor
  belongs_to :user
end
