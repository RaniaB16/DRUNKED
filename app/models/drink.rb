class Drink < ApplicationRecord
  has_many :beverages

  validates :brand, presence: false
  validates :quantity, presence: true
  validates :alcool_type, presence: true
  validates :alcool_degree, presence: true

  def alcool_density
    return 0.80
  end

  def details
    {
      quantity: quantity,
      degree: alcool_degree,
      density: alcool_density
    }
  end

  def drink_sum
    details[:quantity] * details[:degree] * details[:density]
  end

  def label_drink
    "#{alcool_type} - #{quantity / 10} ml - #{alcool_degree * 100}%"
  end
end
