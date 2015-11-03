require 'spec_helper'

feature 'creating links' do
  scenario 'New link submit form' do
    visit ('/links')
    click_button 'Add link'
    fill_in :url, with: 'http://www.whufc.com'
    fill_in :title, with: 'West Ham Homepage'
    click_button 'Submit'
    expect(page).to have_content('West Ham Homepage')
  end
end
