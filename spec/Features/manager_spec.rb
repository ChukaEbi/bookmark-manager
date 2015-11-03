require 'spec_helper'

feature 'homepage' do
  scenario 'view link on homepage ' do
    visit '/'
    link1 = Link.create(:url => 'www.google.com')
    expect(page).to have_content("#{link1}")
  end
end
