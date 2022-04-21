# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :target_date, presence: true, future: true
  validates :recurrance, presence: true, inclusion: { in: %w[daily weekly monthly quarterly yearly never] }

  def accumlated_amount
    return amount if target_date.past?

    daily_accumulation * days_saved
  end

  def daily_accumulation
    amount.to_f / (goal_length.to_f / 1.day)
  end

  def days_saved
    return 0 if goal_started.future?

    Time.zone.today - goal_started
  end

  def goal_started
    return created_at.to_date if recurrance == 'never'

    target_date - goal_length
  end

  private

  # rubocop:disable Metrics/MethodLength
  def goal_length
    case recurrance
    when 'daily'
      1.day
    when 'weekly'
      1.week
    when 'never', 'monthly'
      1.month
    when 'quarterly'
      3.months
    when 'yearly'
      1.year
    end
  end
  # rubocop:enable Metrics/MethodLength
end
