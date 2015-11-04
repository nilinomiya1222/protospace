class RemoveStatusFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :status, :string
    add_column :images, :status, :integer
  end
end
