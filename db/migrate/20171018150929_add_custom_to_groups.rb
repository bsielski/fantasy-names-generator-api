class AddCustomToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :custom, :boolean, default: false
  end
end
