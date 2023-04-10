# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    render locals_with_current_user({ accounts: current_user.accounts })
  end

  def new
    render locals_with_current_user({ account: current_user.accounts.build })
  end

  def edit
    render locals_with_current_user({ account: current_user.accounts.find(params[:id]) })
  end

  def create
    account = current_user.accounts.build(params.require(:account).permit(:name, :balance, :debt))

    return redirect_to accounts_path, notice: t('saved') if account.save

    render locals_with_current_user({ account: })
  end

  def update
    account = current_user.accounts.find(params[:id])

    if account.update(params.require(:account).permit(:name, :balance, :debt))
      return redirect_to accounts_path, notice: t('saved')
    end

    render locals_with_current_user({ account: })
  end

  def destroy
    account = current_user.accounts.find(params[:id])

    return redirect_to accounts_path if account.destroy
  end
end
