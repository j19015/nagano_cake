class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :explanation
      t.integer :price
      t.boolean :is_saled
      t.timestamps
    end
  end
end
