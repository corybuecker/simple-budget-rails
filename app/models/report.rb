# frozen_string_literal: true

class Report
  def initialize(user:)
    self.user = user

    self.goals = user.goals
    self.savings = user.savings
    self.assets = user.accounts.not_debts
    self.debts = user.accounts.debts
  end

  def spendable
    assets.sum(&:balance) - debts.sum(&:balance) - savings.sum(&:amount) - goals.sum(&:current_sinking_fund)
  end

  def spendable_today
    spendable / BigDecimal(days_remaining, 0)
  end

  private

  attr_accessor :user, :assets, :goals, :savings, :debts

  def days_remaining
    Time.zone.today.end_of_month - Time.zone.today
  end
end
