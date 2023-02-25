# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.timestamps

      t.index :email, unique: true
    end
  end
end
