class AddCarAddressToQuestion2 < ActiveRecord::Migration[5.1]
  def change
    add_column :question2s, :carAddress, :string
  end
end
