class CreateFirearms < ActiveRecord::Migration[5.2]
  def change
    create_table :firearms do |t|
      t.integer :user_id
      t.integer :manufacturer_id
      t.text :model
      t.text :calibre
      t.text :family
      t.integer :fire_rate
      t.integer :effective_distance
      t.integer :quantity
      t.text :image

      t.timestamps
    end
  end
end
