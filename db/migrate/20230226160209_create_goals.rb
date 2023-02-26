# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_enum :goals_recurrances, %w[never daily weekly monthly quarterly yearly]

    create_table :goals, id: :uuid do |t|
      t.uuid :user_id, null: false

      t.string :name, null: false
      t.numeric :amount, null: false
      t.enum :recurrance, enum_type: :goals_recurrances, null: false, default: :monthly
      t.date :target_date, null: false
      t.date :start_date

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength

  def down
    drop_table :goals

    execute 'drop type goals_recurrances'
  end
end
