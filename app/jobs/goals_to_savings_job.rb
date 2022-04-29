# frozen_string_literal: true

class GoalsToSavingsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Goal.where(target_date: ...Time.zone.today + 1.day).each do |goal|
      Goal.transaction do
        Saving.create!(name: goal.name, amount: goal.amount, user: goal.user)
        goal.update!(target_date: Time.zone.today + goal.goal_length)
      end
    end
  end
end
