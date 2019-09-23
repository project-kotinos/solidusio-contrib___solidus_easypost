# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Shipment, :vcr do
    let!(:shipment) { order.shipments.first }
    let!(:order) do
      create(:order_with_line_items, line_items_count: 1, ship_address: to) do |order|
        order.variants.each { |v| v.update! weight: 10 }
      end
    end

    let(:to) do
      Spree::Address.create(
        firstname: 'Newt',
        lastname: 'Scamander',
        address1: '200 19th St',
        city: 'Birmingham',
        state: Spree::State.first || create(:state),
        country: Spree::Country.first || create(:country),
        zipcode: 35203,
        phone: '123456789'
      )
    end

    before do
      create_shipping_methods
      shipment.stock_location.update(
        address1: '2630 Cahaba Rd',
        city: 'Birmingham',
        state: Spree::State.first,
        country: Spree::Country.first,
        zipcode: 35223,
       )
    end

    it "'buys' a shipping rate after transitioning to ship" do
      shipment.refresh_rates
      shipment.state = 'ready'

      shipment.ship!
      expect(shipment.tracking).to be_present
    end
  end
end
