class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true,
                         format: Devise.email_regexp,
                         unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end
end
