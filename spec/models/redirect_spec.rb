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

  describe '.find_by_short_url' do

    context 'when the short_url exists' do
      let!(:redirect) { FactoryGirl.create(:redirect) }

      it 'returns a Redirect object' do
        returned_redirect = Redirect.find_by_short_url(redirect.short_url)
        expect(returned_redirect.class).to eq(Redirect)
      end

    end

    context 'when the short_url does not exist' do

      it 'returns a NullRedirect object' do
        returned_redirect = Redirect.find_by_short_url('uh-uh')
        expect(returned_redirect.class).to eq(NullRedirect)
      end

    end

  end

end
