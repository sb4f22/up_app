class AddWepayTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wepay_token, :string
    add_column :users, :wepay_id, :integer
  end
end
