class AddBuyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :buy_id, :integer
  end
end
