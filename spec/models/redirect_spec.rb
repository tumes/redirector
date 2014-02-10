require 'spec_helper'

describe Redirect do

  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :url_token }

  describe 'before_create' do

    it 'calls assign_url_token' do
      redirect = FactoryGirl.build(:redirect)
      expect(redirect).to receive(:assign_url_token)
      redirect.save
    end

  end

  describe '#assign_url_token' do

    it 'calls the token generator' do
      redirect = FactoryGirl.build(:redirect)
      expect(TokenGenerator).to receive(:generate)
      redirect.save
    end

  end

  describe '.create' do

    it 'assigns a url token' do
      TokenGenerator.stub(:generate) { "shorty" }
      redirect = FactoryGirl.build(:redirect)
      redirect.save
      expect(redirect.url_token).to eq("shorty")
    end

  end

  describe '.find_by_url_token' do

    context 'when the url_token exists' do
      let!(:redirect) { FactoryGirl.create(:redirect) }

      it 'returns a Redirect object' do
        returned_redirect = Redirect.find_by_url_token(redirect.url_token)
        expect(returned_redirect.class).to eq(Redirect)
      end

    end

    context 'when the url_token does not exist' do

      it 'returns a NullRedirect object' do
        returned_redirect = Redirect.find_by_url_token('uh-uh')
        expect(returned_redirect.class).to eq(NullRedirect)
      end

    end

  end

end
