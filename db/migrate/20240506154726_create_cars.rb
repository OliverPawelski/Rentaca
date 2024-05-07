class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :colour
      t.decimal :price_per_day
      t.string :location
      t.string :registration_number
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
