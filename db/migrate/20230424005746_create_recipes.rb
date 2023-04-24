class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :description
      t.integer :servings
      t.text :preptime
      t.text :cooktime
      t.text :ingredients
      t.text :instructions
      t.text :image
      t.text :video
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
