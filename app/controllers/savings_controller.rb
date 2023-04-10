# frozen_string_literal: true

class SavingsController < ApplicationController
  def index
    render locals_with_current_user({ savings: current_user.savings })
  end

  def new
    render locals_with_current_user({ saving: current_user.savings.build })
  end

  def edit
    render locals_with_current_user({ saving: current_user.savings.find(params[:id]) })
  end

  def create
    saving = current_user.savings.build(params.require(:saving).permit(:name, :amount))

    return redirect_to savings_path if saving.save

    render locals_with_current_user({ saving: })
  end

  def update
    saving = current_user.savings.find(params[:id])

    return redirect_to savings_path if saving.update(params.require(:saving).permit(:name, :amount))

    render locals_with_current_user({ saving: })
  end

  def destroy
    saving = current_user.savings.find(params[:id])

    return redirect_to savings_path if saving.destroy
  end
end
