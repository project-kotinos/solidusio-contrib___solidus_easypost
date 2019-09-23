# frozen_string_literal: true

require 'spec_helper'

describe Spree::Stock::Package, :vcr do
  let(:package) { create(:shipment).to_package }

  describe '#easypost_parcel' do
    subject { package.easypost_parcel }

    it 'is an EasyPost::Parcel object' do
      expect(subject).to be_a(EasyPost::Parcel)
    end

    it 'has the correct attributes' do
      expect(subject).to have_attributes(
        object: 'Parcel',
        weight: 10.0
      )
    end
  end

  describe '#easypost_shipment' do
    subject { package.easypost_shipment }

    it 'is an EasyPost::Shipment object' do
      expect(subject).to be_a(EasyPost::Shipment)
    end

    it 'calls the api' do
      expect(EasyPost::Shipment).to receive(:create).with(anything)
      subject
    end
  end
end
