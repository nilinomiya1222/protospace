class RemoveTypeFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :type, :string
    add_column :images, :status, :string
  end
end
