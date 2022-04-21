# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    render locals: { user: }
  end

  private

  def user
    User.includes(:goals, :accounts, :savings).where(identity: session[:identity]).first!
  end
end
