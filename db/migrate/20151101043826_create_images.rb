class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :proto_id
      t.string :type

      t.timestamps null: false
    end
  end
end
