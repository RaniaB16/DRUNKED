class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :beverages
  has_many :drinks, through: :beverages
  validates :user, presence: true
end
