class Animal < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_and_species_and_description_and_price,
    against: [ :name, :species, :description, :price],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true
  validates :price, presence: true

  mount_uploader :photo, PhotoUploader
end
