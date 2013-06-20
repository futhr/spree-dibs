require 'spec_helper'

describe Spree::Gateway::Dibs do

  # you must use your own dibs account for these tests.
  let(:login) { change_me }
  let(:password) { change_me }

  before do
    @gateway = Spree::Gateway::Dibs.create!(name: "DIBS", environment: "test", active: true)
    @gateway.set_preference(:login, login)
    @gateway.set_preference(:password, password)
    @gateway.save!

    @country = create(:country, name: "United States", iso_name: "UNITED STATES", iso3: "USA", iso: "US", numcode: 840)
    @state   = create(:state, name: "Maryland", abbr: "MD", country: @country)
    @address = create(:address,
      firstname: "John",
      lastname: "Doe",
      address1: "1234 My Street",
      address2: "Apt 1",
      city: "Washington DC",
      zipcode: "20123",
      phone: "(555)555-5555",
      state: @state,
      country: @country
    )

    @order = create(:order_with_totals, bill_address: @address, ship_address: @address, last_ip_address: "127.0.0.1")
    @order.update!

    # this card info is from http://tech.dibs.dk/10_step_guide/your_own_test/
    @credit_card = create(:credit_card, verification_value: "684", number: "4020051000000000", month: "6", year: "2024", first_name: "John", last_name: "Doe")

    @payment = create(:payment, source: @credit_card, order: @order, payment_method: @gateway, amount: 10.00)
    @payment.payment_method.environment = "test"

    @options = {
      order_id: @order.number + "-" + DateTime.current.to_i.to_s,
      billing_address: @address,
      description: "Store Purchase",
      currency: "USD"
    }
  end

  context "authorize" do
    it "return a success" do
      result = @gateway.authorize(10, @credit_card, @options)
      result.success?.should be_true
    end
  end

  context "capture" do
    it "capture a previous authorization" do
      @payment.process!
      capture_result = @gateway.capture(10, @payment.response_code, nil)
      capture_result.success?.should be_true
    end
  end
end
