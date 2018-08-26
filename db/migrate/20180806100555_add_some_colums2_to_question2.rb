class AddSomeColums2ToQuestion2 < ActiveRecord::Migration[5.1]
  def change
    add_column :question2s, :length_of_service, :string
    add_column :question2s, :employee, :string
    add_column :question2s, :job, :string
    add_column :question2s, :skill, :string
    add_column :question2s, :is_consul, :boolean
    add_column :question2s, :is_wrapping, :boolean
  end
end
