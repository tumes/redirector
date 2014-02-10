require 'spec_helper'

describe ShortenedUrlsController do

  describe "GET #show" do

    context 'when the short_url exists' do
      let!(:redirect) { FactoryGirl.create(:redirect, url: 'http://www.example.com') }

      before { get :show, id: redirect.short_url }

      it { should redirect_to(redirect.url) }
      it { should respond_with(301) }

    end

    context "when the short_url doesn't exist" do
      before { get :show, id: "nope" }

      it { should redirect_to(root_path) }
    end

  end

end
