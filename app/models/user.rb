# frozen_string_literal: true

class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
end
