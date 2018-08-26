class AddMobileOsToQuestion2 < ActiveRecord::Migration[5.1]
  def change
    add_column :question2s, :mobileOS, :integer
  end
end
