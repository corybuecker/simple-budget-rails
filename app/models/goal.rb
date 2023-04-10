# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user

  validates :name, :amount, :target_date, presence: true
  validates :recurrance, presence: true, inclusion: %w[never monthly daily weekly yearly quarterly]

  def sinking_fund
    0
  end
end
