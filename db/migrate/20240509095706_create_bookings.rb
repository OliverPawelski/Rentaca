class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :totalprice

      t.timestamps
    end
  end
end
