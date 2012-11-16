class AddGiftIdToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :gift_id, :integer
    add_column :relationships, :description, :string
    add_column :relationships, :type, :string
  end
end
