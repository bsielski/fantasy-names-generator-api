class AddPositionToNames < ActiveRecord::Migration[5.1]
  def change
    add_column :names, :position, :integer
    add_index :names, :position
  end
end
