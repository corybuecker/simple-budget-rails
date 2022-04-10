# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    render locals: { accounts: user.accounts }
  end

  def create
    account = user.accounts.new(account_params)

    if account.save
      flash.now[:success] = "Account #{account.name} created"
      return render locals: { account: }
    end

    render_flash_error(account.errors.full_messages.join(', ').strip)
  end

  def edit
    render locals: { account: user.accounts.find(params[:id]) }
  end

  def update
    account = fetch_account
    account.assign_attributes(account_params)

    if user.save
      flash.now[:success] = "Account #{account.name} updated"
      return render locals: { account: }
    end

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
