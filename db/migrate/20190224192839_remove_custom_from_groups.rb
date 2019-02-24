class RemoveCustomFromGroups < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :custom, :boolean, default: false
  end
end
