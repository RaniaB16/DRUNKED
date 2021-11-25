class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parties
  has_many :meetings
  has_many :beverages, through: :meetings
  has_many :drinks, through: :beverages
  has_many :friendships, class_name: "Friendship", foreign_key: "user_one"

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

  def initials
    "#{first_name.chr}#{last_name.chr}".upcase
  end
end
