require 'spec_helper'

feature 'homepage' do
  scenario 'view link on homepage ' do
    sign_up
    Link.create(:url => 'http://www.google.com', title: 'Google')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
