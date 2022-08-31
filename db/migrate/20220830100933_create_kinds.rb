class CreateKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :kinds do |t|
      t.text :name
      t.integer :product_id

      t.timestamps
    end
  end
end
