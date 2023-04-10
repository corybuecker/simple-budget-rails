# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user

  validates :name, :balance, presence: true

  scope :debts, -> { where(debt: true) }
  scope :not_debts, -> { where(debt: false) }
end
