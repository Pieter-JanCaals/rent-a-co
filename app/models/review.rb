class Review < ApplicationRecord
  belongs_to :animal
  belongs_to :user

  validates :content, presence: true
end
