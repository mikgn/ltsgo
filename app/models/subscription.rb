class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  before_validation :self_event?, on: :create

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

  private

  def self_event?
    if self.user_id == self.event.user_id
      errors.add(:self_event, I18n.t('form.errors.self_event'))
    end
  end
end
