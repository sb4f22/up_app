class AddRequestToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :request, :decimal
  end
end
