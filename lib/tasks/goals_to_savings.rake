# frozen_string_literal: true

namespace :goals_to_savings do
  task run: :environment do
    GoalsToSavingsJob.perform_later
  end
end
