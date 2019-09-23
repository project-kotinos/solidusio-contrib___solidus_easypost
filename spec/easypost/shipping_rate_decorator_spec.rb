# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::ShippingRate, :vcr do
  let(:rate) { described_class.new name: name }
  let(:name) { 'SuperAwesomeCool' }

  describe '#name' do
    subject { rate.name }

    it 'has the right name' do
      expect(subject).to eq(name)
    end
  end
end
