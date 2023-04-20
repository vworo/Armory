class CreateAmmosFirearms < ActiveRecord::Migration[5.2]
  def change
    create_table :ammos_firearms do |t|
      t.integer :ammo_id
      t.integer :firearm_id
    end
  end
end
