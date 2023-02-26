# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    render locals: { accounts: current_user.accounts }
  end

  def new
    render locals: { account: current_user.accounts.build }
  end
end
