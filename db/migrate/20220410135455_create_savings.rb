# frozen_string_literal: true

# The savings table is created in db/migrate/20220410135455_create_savings.rb
class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :savings do |t|
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
