# frozen_string_literal: true

class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :goals, dependent: :destroy

  attribute :preferences, PreferencesType.new
  before_validation :validate_preferences

  validates :email, presence: true

  private

  def validate_preferences
    return if preferences.valid?

    errors.merge!(preferences)
  end
end
