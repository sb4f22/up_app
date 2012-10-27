class PhotoAsset < ActiveRecord::Base
	attr_accessible :image
	belongs_to :campaign
	has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "300x300>",
      :large => "600x600>"
        }
end
