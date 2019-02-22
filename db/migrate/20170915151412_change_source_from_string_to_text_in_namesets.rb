class ChangeSourceFromStringToTextInNamesets < ActiveRecord::Migration[5.1]
  def up
    change_column :namesets, :source, :text
  end

  def down
    change_column :namesets, :source, :string
  end
end
