class CreateQuestion2s < ActiveRecord::Migration[5.1]
  def change
    create_table :question2s do |t|
      t.string :phone_number
      t.string :postal_code
      t.string :address
      t.integer :prefecture
      t.integer :age
      t.integer :gender
      t.string :car_type
      t.string :model_year
      t.string :color
      t.integer :licence_type
      t.integer :user_id

      t.timestamps
    end
  end
end
