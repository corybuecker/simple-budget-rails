# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :target_date, presence: true, future: true
  validates :frequency, presence: true, inclusion: { in: %w[daily weekly monthly quarterly yearly] }
end
