class CreateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :names do |t|
      t.references :nameset, null: false, foreign_key: true
      t.string :variants, null: false

      t.timestamps
    end
  end
end
