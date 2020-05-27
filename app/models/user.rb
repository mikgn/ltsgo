class User < ApplicationRecord
  # :confirmable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :delete_all

  before_validation :set_name, on: :create

  validates :name, presence: true, length: { maximum: 35 }

  private

  def set_name
    self.name = "User#{rand(1000000)}" if self.name.blank?
  end
end
