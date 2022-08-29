class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.text :title
      t.text :in_location
      t.datetime :takeplace_time
      t.text :description
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
