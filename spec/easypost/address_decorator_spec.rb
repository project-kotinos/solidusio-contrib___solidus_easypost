# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Address, :vcr do
  let(:address) { create :address }

  describe '#easypost_address' do
    subject { address.easypost_address }

    it 'is an EasyPost::Address object' do
      expect(subject).to be_a(EasyPost::Address)
    end

    it 'has the correct attributes' do
      # combination of original address factory from easy post
      # and the spree_modification factories
      is_expected.to have_attributes(
        name: 'John Doe',
        company: 'Company',
        street1: '215 N 7th Ave',
        street2: 'Northwest',
        city: 'Manville',
        state: 'NJ',
        zip: '08835',
        country: 'US',
        phone: '5555550199'
      )
    end
  end
end
