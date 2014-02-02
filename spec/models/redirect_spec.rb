require 'spec_helper'

describe Redirect do

  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :short_url }

  describe 'before_create' do

    it 'calls assign_short_url' do
      redirect = FactoryGirl.build(:redirect)
      expect(redirect).to receive(:assign_short_url)
      redirect.save
    end

  end

  describe '#assign_short_url' do
    it 'calls the token generator' do
      redirect = FactoryGirl.build(:redirect)
      expect(TokenGenerator).to receive(:generate)
      redirect.save
    end
  end

  describe '.create' do

    it 'assigns a short url' do
      TokenGenerator.stub(:generate) { "shorty" }
      redirect = FactoryGirl.build(:redirect)
      redirect.save
      expect(redirect.short_url).to eq("shorty")
    end

  end

end
