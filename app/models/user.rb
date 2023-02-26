# frozen_string_literal: true

class User < ApplicationRecord
  has_many :accounts
  has_many :savings
  has_many :goals
end
