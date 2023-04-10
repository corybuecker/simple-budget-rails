# frozen_string_literal: true

class GoalsController < ApplicationController
  def index
    render locals_with_current_user({ goals: current_user.goals })
  end

  def new
    render locals_with_current_user({ goal: current_user.goals.build })
  end

  def edit
    render locals_with_current_user({ goal: current_user.goals.find(params[:id]) })
  end

  def create
    goal = current_user.goals.build(permitted_params)

    return redirect_to goals_path if goal.save

    render locals_with_current_user({ goal: })
  end

  def update
    goal = current_user.goals.find(params[:id])

    return redirect_to goals_path, notice: t('saved') if goal.update(permitted_params)

    render locals_with_current_user({ goal: })
  end

  def destroy
    goal = current_user.goals.find(params[:id])

    return redirect_to goals_path if goal.destroy
  end

  private

  def permitted_params
    params.require(:goal).permit(:name, :amount, :recurrance, :target_date, :start_date)
  end
end
