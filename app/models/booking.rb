class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.pending
    where(confirmed: nil)
  end

  def self.confirmed
    where(confirmed: true)
  end

  def self.rejected
    where(confirmed: false)
  end
end
