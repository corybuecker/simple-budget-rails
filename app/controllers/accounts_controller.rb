# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    render locals: { accounts: user.accounts, user: }
  end

  def new
    render locals: { account: user.accounts.new, user: }
  end

  def create
    account = user.accounts.new(account_params)
    return render locals: { account:, user: } if account.save

    render_flash_error(account.errors.full_messages.join(', ').strip)
  end

  def edit
    render locals: { account: user.accounts.find(params[:id]), user: }
  end

  def update
    account = fetch_account
    return render locals: { account: } if account.update(account_params)

    render_flash_error(account.errors.full_messages.join(', ').strip)
  end

  def destroy
    account = fetch_account
    return render locals: { account: } if account.destroy

    render_flash_error(account.errors.full_messages.join(', ').strip)
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end

  def user
    User.find_by(identity: session[:identity])
  end

  def fetch_account
    user.accounts.find(params[:id])
  end
end
