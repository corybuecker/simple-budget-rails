# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    user = load_user

    total = user.accounts.reject(&:debt?).sum(&:balance)
    total -= user.accounts.select(&:debt?).sum(&:balance)
    total -= user.savings.sum(&:amount)
    total -= user.goals.sum(&:accumlated_amount)

    render locals: { user:, total: }
  end

  private

  def load_user
    User.includes(:goals, :accounts, :savings).where(identity: session[:identity]).first!
  end
end
