class AddWepayAccountIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wepay_account_id, :integer
    add_column :users, :wepay_account_uri, :string
  end
end
