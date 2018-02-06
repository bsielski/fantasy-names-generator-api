class CreateNamesets < ActiveRecord::Migration[5.1]
  def change
    create_table :namesets do |t|
      t.references :subgroup, foreign_key: true
      t.integer :position
      t.string :label, null: false
      t.string :source, null: true
      t.string :name_separator, null: false, default: ";"
      t.string :variant_separator, null: false, default: ","

      t.timestamps
    end
  end
end
