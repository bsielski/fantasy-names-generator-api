class AddSubgroupsCountToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :subgroups_count, :integer
  end
end
