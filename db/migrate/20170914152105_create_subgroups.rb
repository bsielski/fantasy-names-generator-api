class CreateSubgroups < ActiveRecord::Migration[5.1]
  def change
    create_table :subgroups do |t|
      t.references :group, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
