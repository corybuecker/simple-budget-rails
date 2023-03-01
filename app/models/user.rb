# frozen_string_literal: true

class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :goals, dependent: :destroy

  validates :email, presence: true

  attribute :preferences, PreferencesType.new
end
