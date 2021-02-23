class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.references :user
      t.integer :price_per_day
      t.string :name
      t.string :length
      t.text :description
      t.string :port_location
      t.string :type
      t.integer :year
      t.integer :passenger_capacity

      t.timestamps
    end
  end
end
