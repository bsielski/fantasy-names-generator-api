class AddSubrgoupsCountToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :subgroups_count, :integer
  end
end
