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
      time_peak = drinks.first.created_at + (drinks.count * 2700)
      time_elapsed = (Time.now.in_time_zone("Europe/Paris") - time_peak.in_time_zone('Europe/Paris')) / 60
    end

    new_alcool_rate = alcool_rate - (0.12 * time_elapsed / 60)
    new_alcool_rate = alcool_rate if time_elapsed.negative?
    time_to_dedrunk = ((60 * new_alcool_rate) / 0.12).round
    time_format = time_format(time_to_dedrunk)
    return {
      alcool_rate: new_alcool_rate.round(2),
      time_elapsed: time_elapsed.round(2),
      time_format: time_format
    }
  end

  private

  def time_format(minutes)
    hours = minutes / 60
    rest = minutes % 60
    puts "#{hours}:#{rest}"
  end
end
