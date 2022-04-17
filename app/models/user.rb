# frozen_string_literal: true

class User < ApplicationRecord
  with_options dependent: :destroy do
    has_many :accounts
    has_many :goals
    has_many :savings
  end
end
