class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def total_day
  (self.check_out - self.check_in).to_i
  end

  def total_amount
   self.total_day.to_i * self.customer * self.room.price
  end

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :customer, presence: true, numericality: true
end
