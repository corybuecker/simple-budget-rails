# frozen_string_literal: true

class RenameAmountToBalance < ActiveRecord::Migration[7.0]
  def change
    change_table :accounts do |t|
      t.rename :amount, :balance
    end
  end
end
