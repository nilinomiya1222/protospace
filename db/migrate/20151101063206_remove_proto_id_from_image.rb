class RemoveProtoIdFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :proto_id, :integer
    add_column :images, :prototype_id, :integer
  end
end
