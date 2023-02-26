# frozen_string_literal: true

class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")

    create_table :savings, id: :uuid do |t|
      t.string :name, null: false
      t.numeric :amount, null: false

      t.timestamps
    end

    add_reference :savings, :user, type: :uuid, foreign_key: true, index: true
  end
end
