class Image < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_presence_of :event
  validates_presence_of :user

  mount_uploader :image, ImageUploader

  scope :persisted, -> { where.not(id: nil) }
end
