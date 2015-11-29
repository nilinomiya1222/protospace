class RenameImageToImages < ActiveRecord::Migration
  def change
    rename_column :images, :image, :content
  end
end
