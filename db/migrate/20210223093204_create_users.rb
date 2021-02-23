class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.date :date_of_birth
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
