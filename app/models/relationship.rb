class Relationship < ActiveRecord::Base
  attr_accessible :funded_id, :amount, :gift_id, :description, :type, :checkout_id, :checkout_uri

  belongs_to :funder, class_name: "User"
  belongs_to :funded, class_name: "User"
end