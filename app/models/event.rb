class Event < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :address, presence: true
  validates :datetime, presence: true
end
