# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :target_date, presence: true, future: true
  validates :recurrance, presence: true, inclusion: { in: %w[daily weekly monthly quarterly yearly never] }

  def accumlated_amount
    return amount if target_date.past?

    daily_accumulation * days_remaining
  end

  private

  def daily_accumulation
    amount.to_f / (target_date - goal_started).to_i
  end

  def days_remaining
    (Time.zone.today - goal_started)
  end

  # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  def goal_started
    case recurrance
    when 'daily'
      1.day.ago.to_date
    when 'weekly'
      1.week.ago.to_date
    when 'monthly'
      1.month.ago.to_date
    when 'quarterly'
      3.months.ago.to_date
    when 'yearly'
      1.year.ago.to_date
    else
      Time.zone.today.beginning_of_month
    end
  end
  # rubocop:enable Metrics/AbcSize,Metrics/MethodLength
end
