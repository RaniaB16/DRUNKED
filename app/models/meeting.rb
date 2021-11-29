class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :beverages
  has_many :drinks, through: :beverages

  validates :user, presence: true
  validates :party, presence: true

  def alcool_rate
    drinks.map { |drink| (drink.drink_sum / user.user_sum) }.sum.round(2)
  end

  def sobriaty
  if drinks.empty?
    time_elapsed = 0
  else
    time_peak = drinks.first.created_at + (drinks.count * 2700).seconds
    time_elapsed = (time_peak - Time.now)
  end
  raise
  new_alcool_rate = alcool_rate #- 0.12 * time_elapsed / 60
  new_alcool_rate = 0 if new_alcool_rate.negative?
  return {
    alcool_rate: new_alcool_rate,
    time_elapsed: time_elapsed
    }
  end
end
