class CreateNamesets < ActiveRecord::Migration[6.0]
  def change
    create_table :namesets do |t|
      t.references :subgroup, null: false, foreign_key: true
      t.integer :position
      t.string :label
      t.text :source
      t.string :name_separator
      t.string :variant_separator
      t.integer :names_count
      t.timestamps
    end
  end
end
