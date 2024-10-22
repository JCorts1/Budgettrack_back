class Expenditure < ApplicationRecord
  belongs_to :user
  validates :amount, :category, :month, presence: true
  validate :user_must_be_logged_in

  private

  def user_must_be_logged_in
    if user.nil?
      errors.add(:user, "must be logged in")
    end
  end
end
