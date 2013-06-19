module Spree
  class Gateway::Dibs < Gateway
    preference :login, :string
    preference :password, :string

    attr_accessible :preferred_login, :preferred_password

    def provider_class
      ActiveMerchant::Billing::DibsGateway
    end

    def actions
      %w(authorize capture refund credit void)
    end

    def authorize(money, creditcard, options = {})
      if preferences[:test_mode]
        ActiveMerchant::Billing::Base.mode = :test
      end

      # this is awful but unavoidable to send clients ip address
      order_number = options[:order_id].split('-')[0]
      order = Order.where(number: order_number).first
      options[:clientIp] = order.last_ip_address

      # do this instead of change the gateway,
      options[:orderId] = options[:order_id]

      # spree sends year as YYYY, this active_merchant gateway uses YY
      creditcard.year = creditcard.year[-2,2]
      provider.authorize(money, creditcard, options)
    end
  end
end
