class Campaign < ActiveRecord::Base
  attr_accessible :coop_name, :coop_location, :short_description, 
  :long_description, :video_link, :category, :request, :image, :active, :end_date, :video_id
  belongs_to :user

  has_many :previews
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "600x600>" }
  
  before_save :create_video_id

  before_save :activate if :active_changed?

  validates :user_id, presence: true, uniqueness: true
  validates :coop_name, presence: true
  validates :coop_location, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :category, presence: true

  def create_video_id
    self.video_id = self.video_link.gsub("http://youtu.be/", "")
  end

  def activate
    self.toggle!(:active)
    self.end_date = 30.days.from_now
  end
end
