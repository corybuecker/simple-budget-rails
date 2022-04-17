# frozen_string_literal: true

class GoalsController < ApplicationController
  def index
    render locals: { goals: user.goals, user: }
  end

  def new
    render locals: { goal: user.goals.new, user: }
  end

  def create
    goal = user.goals.new(goal_params)
    return render locals: { goal:, user: } if goal.save

    render_flash_error(goal.errors.full_messages.join(', ').strip)
  end

  def edit
    render locals: { goal: user.goals.find(params[:id]), user: }
  end

  def update
    goal = fetch_goal
    return render locals: { goal: } if goal.update(goal_params)

    render_flash_error(goal.errors.full_messages.join(', ').strip)
  end

  def destroy
    goal = fetch_goal
    return render locals: { goal: } if goal.destroy

    render_flash_error(goal.errors.full_messages.join(', ').strip)
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :amount, :target_date, :frequency)
  end

  def user
    User.find_by(identity: session[:identity])
  end

  def fetch_goal
    user.goals.find(params[:id])
  end
end
