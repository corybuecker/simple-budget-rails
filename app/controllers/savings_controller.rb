# frozen_string_literal: true

class SavingsController < ApplicationController
  def index
    render locals: { savings: user.savings, user: }
  end

  def new
    render locals: { saving: user.savings.new, user: }
  end

  def create
    saving = user.savings.new(saving_params)
    return render locals: { saving:, user: } if saving.save

    render turbo_stream: turbo_stream.replace(:form, partial: 'form', locals: { saving:, user: }),
           status: :unprocessable_entity
  end

  def edit
    render locals: { saving: user.savings.find(params[:id]), user: }
  end

  def update
    saving = fetch_saving
    return render locals: { saving: } if saving.update(saving_params)

    render turbo_stream: turbo_stream.replace(:form, partial: 'form', locals: { saving:, user: }),
           status: :unprocessable_entity
  end

  def destroy
    saving = fetch_saving.destroy
    render locals: { saving: }
  end

  private

  def saving_params
    params.require(:saving).permit(:name, :amount)
  end

  def user
    User.find_by(identity: session[:identity])
  end

  def fetch_saving
    user.savings.find(params[:id])
  end
end
