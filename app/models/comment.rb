class Comment < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :body, presence: true
  validates :user_name, presence: true, if: -> { user.present? }

  private

  def user_name
    user.present? ? user.name : super
  end
end
