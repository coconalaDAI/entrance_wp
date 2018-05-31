class CreateQuestion2s < ActiveRecord::Migration[5.1]
  def change
    create_table :question2s do |t|
      t.string :phone_number
      t.string :postal_code
      t.string :address
      t.string :prefecture
      t.integer :age
      t.string :gender
      t.string :car_type
      t.string :model_year
      t.string :color
      t.string :licence_type
      t.integer :user_id

      t.timestamps
    end
  end
end
