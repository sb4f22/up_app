class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :funder_id
      t.integer :funded_id
      t.decimal :amount

      t.timestamps
    end

    add_index :relationships, :funder_id
    add_index :relationships, :funded_id
    add_index :relationships, [:funder_id, :funded_id]
    add_index :relationships, :amount
  end
end
