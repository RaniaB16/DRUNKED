class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parties
  has_many :meetings
  has_many :beverages, through: :meetings
  has_many :drinks, through: :beverages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :weight, presence: true
end
