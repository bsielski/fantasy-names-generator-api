class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.references :nameset, null: false, foreign_key: true
      t.integer :position
      t.text :variants
      t.timestamps
    end
    add_index :names, :position
  end
end
