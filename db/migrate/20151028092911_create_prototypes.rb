class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.integer :user_id
      t.text :copy
      t.text :concept

      t.timestamps
    end
  end
end
