# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user

  validates :name, :balance, presence: true
end
