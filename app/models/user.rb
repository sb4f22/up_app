# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation, 
					:wepay_token, :wepay_id, :wepay_account_id, :wepay_account_uri
	has_secure_password
	has_many :campaigns, dependent: :destroy
	has_many :gifts, dependent: :destroy
	has_many :relationships, foreign_key: "funder_id", dependent: :destroy
	has_many :funded_users, through: :relationships, source: :funded
	has_many :reverse_relationships, foreign_key: "funded_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
    has_many :funders, through: :reverse_relationships, source: :funder
    has_many :authentications


	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token


	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
	uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true


	def apply_omniauth(omniauth)
  		self.email = omniauth['user_info']['email'] if email.blank?
  		authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
	end

  	private

	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end

end
