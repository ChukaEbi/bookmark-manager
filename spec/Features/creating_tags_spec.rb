require 'spec_helper'

feature 'creating links with tags' do
  scenario 'New link submit form' do
    visit ('/links/new')
    fill_in :url, with: 'http://www.whufc.com'
    fill_in :title, with: 'West Ham Homepage'
    fill_in :tags, with: 'Sports'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Sports')
    expect(page).to have_content('Sports')
  end
end
