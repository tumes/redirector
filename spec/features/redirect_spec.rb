require 'spec_helper'

describe 'creating a redirect' do

  context 'when the url has not been created' do

    it 'allows the user to create a new redirect' do
      visit root_path
      fill_in "Url", with: 'http://www.example.com'
      click_button "Shorten"

      expect(page).to have_content "Your url is:"
    end

    it 'creates a new redirect' do
      visit root_path
      fill_in "Url", with: 'http://www.example.com'
      expect { click_button "Shorten" }.to change { Redirect.count }.by(1)
    end

  end

  context 'when the url has been created' do
    let!(:redirect) { FactoryGirl.create(:redirect, url: "http://www.example.com") }

    it 'allows the user to create a new redirect' do
      visit root_path
      fill_in "Url", with: 'http://www.example.com'
      click_button "Shorten"

      expect(page).to have_content "Your url is:"
      expect(current_path).to eq(redirect_path(redirect))
    end

    it 'returns the existing redirect' do
      visit root_path
      fill_in "Url", with: 'http://www.example.com'
      expect { click_button "Shorten" }.not_to change{ Redirect.count }
    end

  end

end
