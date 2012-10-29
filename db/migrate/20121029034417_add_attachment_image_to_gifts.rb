class AddAttachmentImageToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :gifts, :image
  end
end
