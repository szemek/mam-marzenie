# User is a volunteer
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :members
  has_many :dreams, through: :members
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, :email, :region, presence: true

  def self.regions
    [
      'Białystok', 'Bydgoszcz', 'Gorzów Wielkopolski', 'Katowice', 'Kielce',
      'Kraków', 'Lublin', 'Łódź', 'Olsztyn', 'Opole', 'Poznań', 'Rzeszów',
      'Szczecin', 'Trójmiasto', 'Warszawa', 'Wrocław'
    ]
  end
end
