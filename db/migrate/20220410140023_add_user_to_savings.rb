# frozen_string_literal: true

class AddUserToSavings < ActiveRecord::Migration[7.0]
  def change
    add_reference :savings, :user
    add_foreign_key :savings, :users, on_delete: :cascade
  end
end
