class CreateAlbumsTable < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
