class Campaign < ActiveRecord::Base
  attr_accessible :coop_name, :coop_location, :short_description, 
  :long_description, :video_link, :category, :image
  belongs_to :user
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "600x600>" }
  
  validates :user_id, presence: true, uniqueness: true
  validates :coop_name, presence: true
  validates :coop_location, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :category, presence: true

end
