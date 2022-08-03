class RenameTypeFromBoats < ActiveRecord::Migration[7.0]
  def change
    rename_column :boats, :type, :boat_type
  end
end
