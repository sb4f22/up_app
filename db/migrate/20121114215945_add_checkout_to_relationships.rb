class AddCheckoutToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :checkout_id, :integer
    add_column :relationships, :checkout_uri, :string
  end
end
