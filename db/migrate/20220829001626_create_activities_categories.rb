class CreateActivitiesCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_categories do |t|
      t.integer :activity_id
      t.integer :category_id
    end
  end
end
