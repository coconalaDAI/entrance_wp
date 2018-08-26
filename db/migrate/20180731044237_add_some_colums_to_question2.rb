class AddSomeColumsToQuestion2 < ActiveRecord::Migration[5.1]
  def change
    add_column :question2s, :lastName, :string
    add_column :question2s, :firstName, :string
    add_column :question2s, :isDriveRecorder, :boolean
  end
end
