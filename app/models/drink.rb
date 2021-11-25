class Drink < ApplicationRecord
  has_many :beverages

  validates :brand, presence: false
  validates :quantity, presence: true
  validates :alcool_type, presence: true
  validates :alcool_degree, presence: true

  def alcool_density
    return 0.80
  end
end
