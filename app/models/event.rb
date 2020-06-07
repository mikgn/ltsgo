class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  scope :order_by_closest, -> { order(:datetime) }

  validates :title, presence: true, length: { maximum: 255 }
  validates_presence_of :user, :datetime, :description, :address
end
