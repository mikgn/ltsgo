class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validate :self_event?, on: :create, if: -> { user.present? }
  validate :email_exists?, on: :create, unless: -> { user.present? }

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

  def email_exists?
    user_with_registered_email = User.find_by(email: user_email)

    if user_with_registered_email.exists?
      errors.add(:email, I18n.t('form.errors.already_exists'))
    end
  end

  private

  def self_event?
    if user_id == event.user_id
      errors.add(:user, I18n.t('form.errors.self_event'))
    end
  end
end
