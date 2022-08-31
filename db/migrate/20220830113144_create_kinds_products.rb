class CreateKindsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :kinds_products do |t|
      t.integer :kind_id
      t.integer :product_id
    end
  end
end
