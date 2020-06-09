class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  before_validation :self_event?, on: :create
  before_validation :email_exists?, on: :create, unless: -> { user.present? }

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

  def email_exists?
    user_with_registered_email = User.where(email: self.user_email)

    if user_with_registered_email.exists?
      errors.add(:email, I18n.t('form.errors.already_exists'))
    end
  end

  def self_event?
    if self.user_id == self.event.user_id
      errors.add(:self_event, I18n.t('form.errors.self_event'))
    end
  end
end
