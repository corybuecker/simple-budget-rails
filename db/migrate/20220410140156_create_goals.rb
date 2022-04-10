# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end

    add_reference :goals, :user
    add_foreign_key :goals, :users, on_delete: :cascade
  end
end
