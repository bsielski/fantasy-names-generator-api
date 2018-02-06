class AddNamesCountToNamesets < ActiveRecord::Migration[5.1]
  def change
    add_column :namesets, :names_count, :integer
  end
end
