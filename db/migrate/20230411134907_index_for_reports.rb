class IndexForReports < ActiveRecord::Migration[7.0]
  def change
    add_index :accounts, %i[user_id debt]
  end
end
