# frozen_string_literal: true

class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :goals, dependent: :destroy

  attribute :preferences, PreferencesType.new
  validate :preferences_valid?

  validates :email, presence: true

  private

  def preferences_valid?
    return if preferences.valid?

    preferences.errors.each do |error|
      errors.add(:preferences, error.full_message)
    end
  end
end
