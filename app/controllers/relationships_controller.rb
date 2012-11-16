class RelationshipsController < ApplicationController
  include WepayRails::Payments

	def new
	end

	def create
    @relationship = current_user.relationships.build(params[:relationship])
    if @relationship.save
      @app_fee = (@relationship.amount)*(0.07)
      wepay_gateway = WepayRails::Payments::Gateway.new(@relationship.funded.wepay_token)
      response = wepay_gateway.perform_checkout({
        :account_id         => @relationship.funded.wepay_account_id,
        :amount             => @relationship.amount,
        :app_fee            => @app_fee,
        :short_description  => @relationship.description,
        :redirect_uri       => 'http://192.168.42.142:3000/thankyou',
        :type               => 'GOODS'
        })
      @relationship.checkout_id = response[:checkout_id]
      @relationship.checkout_uri = response[:checkout_uri]
      @relationship.save!
      @gift_id = @relationship.gift_id
      @gift = Gift.find_by_id(@gift_id)
      @gift_count = @gift.count - 1
      @gift.update_attributes(:count => @gift_count)
      redirect_to @relationship.checkout_uri
    else 
      render '@campaign'
    end
  end

    def show
      @relationship = Relationship.find_by_id(params[:id])
    end

  def thankyou

  end


end