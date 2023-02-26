# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, id: :uuid do |t|
      t.uuid :user_id, null: false

      t.string :name, null: false
      t.numeric :balance, null: false
      t.boolean :debt, null: false, default: false

      t.timestamps
    end
  end
end
