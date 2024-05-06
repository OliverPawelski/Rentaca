class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.integer :id
      t.string :name
      t.string :colour
      t.decimal :price_per_day
      t.string :location
      t.string :registration_number
      t.integer :user_id

      t.timestamps
    end
  end
end
