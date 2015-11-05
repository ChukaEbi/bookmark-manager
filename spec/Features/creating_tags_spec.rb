require 'spec_helper'

feature 'creating links with tags' do
  scenario 'New link submit form' do
    create_link('http://www.whufc.com','West Ham Homepage','Sports')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Sports')
    expect(page).to have_content('Sports')
  end
end
