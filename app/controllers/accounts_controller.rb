# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    render locals: { accounts: current_user.accounts }
  end

  def new
    render locals: { account: current_user.accounts.build, current_user: }
  end

  def edit
    render locals: { account: current_user.accounts.find(params[:id]), current_user: }
  end

  def create
    account = current_user.accounts.build(params.require(:account).permit(:name, :balance, :debt))

    return redirect_to accounts_path if account.save

    render locals: { account:, current_user: }
  end

  def update
    account = current_user.accounts.find(params[:id])

    return redirect_to accounts_path if account.update(params.require(:account).permit(:name, :balance, :debt))

    render locals: { account:, current_user: }
  end
end
