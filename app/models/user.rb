class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meetings
  #has_many :parties
  has_many :parties, through: :meetings
  has_many :beverages, through: :meetings
  has_many :drinks, through: :beverages
  has_many :friendships, class_name: "Friendship", foreign_key: "user_one"
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :weight, presence: true

  def friends
    friendships.map do |e|
      e.user_two
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end


  def sex_ratio
    if sex == "man"
      0.7
    else
      0.6
    end
  end

  def details
    {
      weight: weight,
      sex_ratio: sex_ratio
    }
  end

  def user_sum
    details[:weight] * details[:sex_ratio]
  end

  def initials
    "#{first_name.chr}#{last_name.chr}".upcase
  end

  def user_alcool_rate(party)
   meeting = Meeting.find_by(user: self, party: party)
   meeting.alcool_rate
  end

  def drunked_color(party)
    return 'bg-success' if user_alcool_rate(party).zero?
    return 'bg-warning' if user_alcool_rate(party) < 0.5

    'bg-danger'
  end
end
