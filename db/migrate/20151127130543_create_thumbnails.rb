class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :content
      t.integer :prototype_id
      t.string :status
      t.timestamps
    end
  end
end
