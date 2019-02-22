class ChangeVariantsFromStringToTextInNames < ActiveRecord::Migration[5.1]
  def up
    change_column :names, :variants, :text
  end

  def down
    change_column :names, :variants, :string
  end
end
