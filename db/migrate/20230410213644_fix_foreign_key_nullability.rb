# frozen_string_literal: true

class FixForeignKeyNullability < ActiveRecord::Migration[7.0]
  def up
    change_column_null :accounts, :user_id, false
    change_column_null :goals, :user_id, false
    change_column_null :savings, :user_id, false
  end

  def down
    change_column_null :accounts, :user_id, true
    change_column_null :goals, :user_id, true
    change_column_null :savings, :user_id, true
  end
end
