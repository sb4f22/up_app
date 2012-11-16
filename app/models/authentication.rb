class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user

  before_save :create_wepay_account

  private

  def create_wepay_account
    wepay_gateway = WepayRails::Payments::Gateway.new(self.user)
    response = wepay_gateway.create_account({
      :name => "New User Account",
      :description => "This account will collect payments on behalf of my app.",
      :reference_id => self.id # optional, leave blank for WePay to generate a reference_id for you
    })
    self.wepay_account_id = response[:account_id]
    self.save
  end
end
