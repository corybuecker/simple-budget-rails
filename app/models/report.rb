class Report
  def initialize(user:)
    self.user = user

    self.goals = user.goals
    self.savings = user.savings
    self.assets = user.accounts.not_debts
    self.debts = user.accounts.debts
  end

  def spendable
    assets.sum(&:balance) - debts.sum(&:balance) - savings.sum(&:amount) - goals.sum(&:sinking_fund)
  end

  private

  attr_accessor :user, :assets, :goals, :savings, :debts
end
