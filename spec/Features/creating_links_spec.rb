require 'spec_helper'

feature 'creating links' do
  scenario 'New link submit form' do
    sign_up
    create_link('http://www.whufc.com','West Ham Homepage','what')
    expect(page).to have_content('West Ham Homepage')
  end
end
