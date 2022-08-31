class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.boolean :sold
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
