# frozen_string_literal: true

class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :savings, id: :uuid do |t|
      t.uuid :user_id, null: false

      t.string :name, null: false
      t.numeric :amount, null: false

      t.timestamps
    end
  end
end
