# frozen_string_literal: true

class SavingsController < ApplicationController
  def index
    render locals: { savings: current_user.savings }
  end

  def new
    render locals: { saving: current_user.savings.build, current_user: }
  end

  def edit
    render locals: { saving: current_user.savings.find(params[:id]), current_user: }
  end

  def create
    saving = current_user.savings.build(params.require(:saving).permit(:name, :amount))

    return redirect_to savings_path if saving.save

    render locals: { saving:, current_user: }
  end

  def update
    saving = current_user.savings.find(params[:id])

    return redirect_to savings_path if saving.update(params.require(:saving).permit(:name, :amount))

    render locals: { saving:, current_user: }
  end
end
