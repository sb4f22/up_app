class AddAttachmentImageToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :campaigns, :image
  end
end
