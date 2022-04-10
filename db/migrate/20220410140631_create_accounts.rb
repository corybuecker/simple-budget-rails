# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.integer :amount, null: false
      t.boolean :debt, null: false, default: false
      t.timestamps
    end

    add_reference :accounts, :user
    add_foreign_key :accounts, :users, on_delete: :cascade
  end
end
