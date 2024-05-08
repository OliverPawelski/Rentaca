class AddUserIdToCars < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :user, null: false, foreign_key: true, default: User.first.id
  end
end
