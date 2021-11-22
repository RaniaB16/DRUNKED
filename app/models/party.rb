class Party < ApplicationRecord
  belongs_to :user
  has_many :meetings
  validates :name, presence: true
end
