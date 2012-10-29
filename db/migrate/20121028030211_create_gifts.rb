class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|

      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :price
      t.integer :count
      
      t.timestamps
    end
    add_index :gifts, [:user_id, :price]
  end
end

