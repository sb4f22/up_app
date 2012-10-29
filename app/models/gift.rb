class Gift < ActiveRecord::Base
  attr_accessible :name, :description, :price, :count, :image

  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "600x600>" }

  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :count, presence: true


end
