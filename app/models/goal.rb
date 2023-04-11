# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user

  validates :name, :amount, :target_date, presence: true
  validates :recurrance, presence: true, inclusion: %w[never monthly daily weekly yearly quarterly]

  def current_sinking_fund
    amount / BigDecimal(days_to_sink, 0) * days_elapsed
  end

  def days_remaining
    return BigDecimal(0, 0) if target_date <= Time.zone.today

    BigDecimal(target_date - Time.zone.today, 0)
  end

  def days_elapsed
    return BigDecimal(0, 0) if target_date <= Time.zone.today

    BigDecimal(Time.zone.today - previous_saving_date, 0)
  end

  private

  # rubocop:disable Metrics/MethodLength
  def days_to_sink
    target_date - previous_saving_date
  end

  def previous_saving_date
    case recurrance
    when 'daily'
      target_date.yesterday
    when 'weekly'
      target_date.last_week
    when 'monthly'
      target_date.last_month
    when 'yearly'
      target_date.last_year
    when 'quarterly'
      target_date.last_quarter
    else
      target_date
    end
  end

  def next_saving_date
    case recurrance
    when 'monthly'
      target_date.next_month
    when 'daily'
      target_date.tomorrow
    when 'weekly'
      target_date.next_week
    when 'yearly'
      target_date.next_year
    when 'quarterly'
      target_date.next_quarter
    else
      target_date
    end
  end
  # rubocop:enable Metrics/MethodLength
end
