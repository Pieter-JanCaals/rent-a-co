class Animal < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true
  validates :price, presence: true

  mount_uploader :photo, PhotoUploader
end
