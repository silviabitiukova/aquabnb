class AddImageUrlToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :boat_image, :string
  end
end
