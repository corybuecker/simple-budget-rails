class AddTransactions < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :transactions, id: :uuid do |t|
      t.numeric :amount, null: false

      t.timestamps
    end

    add_reference :transactions, :user, type: :uuid, foreign_key: true, index: true, null: false
  end
end
