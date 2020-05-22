class User < ApplicationRecord
  has_many :events

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 40 }

  validates :email, presence: true,
            email: true,
            uniqueness: { case_sensitive: false }
end
