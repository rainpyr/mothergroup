class AddBuyIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :buy_id, :integer
  end
end
