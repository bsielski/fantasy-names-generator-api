class AddNamesetsCountToSubgroups < ActiveRecord::Migration[5.1]
  def change
    add_column :subgroups, :namesets_count, :integer
  end
end
