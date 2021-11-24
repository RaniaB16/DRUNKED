class Party < ApplicationRecord
  belongs_to :user
  has_many :meetings
  has_many :users, through: :meetings

  validates :name, presence: true
end
