class CreateSubgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :subgroups do |t|
      t.references :group, null: false, foreign_key: true
      t.integer :position
      t.integer :namesets_count
      t.timestamps
    end
  end
end
