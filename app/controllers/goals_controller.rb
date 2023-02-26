# frozen_string_literal: true

class GoalsController < ApplicationController
  def index
    render locals: { goals: current_user.goals }
  end

  def new
    render locals: { goal: current_user.goals.build, current_user: }
  end

  def edit
    render locals: { goal: current_user.goals.find(params[:id]), current_user: }
  end

  def create
    goal = current_user.goals.build(params.require(:goal).permit(:name, :amount, :recurrance, :target_date))

    return redirect_to goals_path if goal.save

    render locals: { goal:, current_user: }
  end

  def update
    goal = current_user.goals.find(params[:id])

    return redirect_to goals_path if goal.update(params.require(:goal).permit(:name, :amount, :recurrance,
                                                                              :target_date, :start_date))

    render locals: { goal:, current_user: }
  end
end
