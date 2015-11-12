class AddPrototypeIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :prototype_id, :integer
    remove_column :comments, :proto_id, :integer
  end
end
