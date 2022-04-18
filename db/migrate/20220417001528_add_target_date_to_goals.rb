# frozen_string_literal: true

class AddTargetDateToGoals < ActiveRecord::Migration[7.0]
  def change
    create_enum :goal_recurrances, %w[weekly daily monthly quarterly yearly never]

    change_table :goals, bulk: true do |t|
      t.date :target_date, null: false
      t.enum :recurrance, null: false, enum_type: 'goal_recurrances', default: 'monthly'
    end
  end
end
