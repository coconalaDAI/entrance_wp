class ChangeSomeColumnUsers < ActiveRecord::Migration[5.1]
  def change
      # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
      change_column :question2s, :licence_type, :string
      change_column :question2s, :gender, :string
      change_column :question2s, :age, :string
      change_column :question2s, :prefecture, :string
      change_column :question2s, :mobileOS, :string
  end
end
