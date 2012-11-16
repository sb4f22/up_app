require "omniauth/strategies/wepay"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wepay, '169621', 'c68f718810'
end