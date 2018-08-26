class AddAddress2ToQuestion2 < ActiveRecord::Migration[5.1]
  def change
    add_column :question2s, :address2, :string
  end
end
