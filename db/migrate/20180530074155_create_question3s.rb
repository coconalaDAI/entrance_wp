class CreateQuestion3s < ActiveRecord::Migration[5.1]
  def change
    create_table :question3s do |t|
      t.string :length_of_service
      t.string :employee
      t.string :job
      t.string :skill
      t.boolean :is_consul
      t.boolean :is_wrapping
      t.integer :user_id

      t.timestamps
    end
  end
end
