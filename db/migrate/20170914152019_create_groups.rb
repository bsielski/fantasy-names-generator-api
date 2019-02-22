class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :label, null: false
      t.integer :position

      t.timestamps
    end
  end
end
