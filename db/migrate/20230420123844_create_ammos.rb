class CreateAmmos < ActiveRecord::Migration[5.2]
  def change
    create_table :ammos do |t|
      t.integer :user_id
      t.integer :manufacturer_id
      t.text :name
      t.text :calibre
      t.integer :bullet_velocity
      t.integer :fragmentation_chance
      t.integer :ricochet_chance
      t.integer :quantity
      t.text :image

      t.timestamps
    end
  end
end
