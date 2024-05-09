class CreateBookingRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_requests do |t|
      t.integer :car_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
