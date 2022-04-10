# frozen_string_literal: true

class AddIdentityToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.uuid :identity, null: false, default: 'gen_random_uuid()'
    end
  end
end
