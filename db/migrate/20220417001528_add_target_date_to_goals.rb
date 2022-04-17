# frozen_string_literal: true

class AddTargetDateToGoals < ActiveRecord::Migration[7.0]
  def change
    create_enum :goal_frequencies, %w[weekly daily monthly quarterly yearly]

    change_table :goals, bulk: true do |t|
      t.date :target_date, null: false
      t.enum :frequency, null: false, enum_type: 'goal_frequencies', default: 'monthly'
    end
  end
end
