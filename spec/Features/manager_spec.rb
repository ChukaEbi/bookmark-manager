require 'spec_helper'

feature 'homepage' do
  scenario 'view link on homepage ' do
    Link.create(:url => 'http://www.google.com', title: 'Google')
    visit '/views'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
