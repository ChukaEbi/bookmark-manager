require 'spec_helper'

feature "new user signs up" do
  scenario "user wants to have a bookmark page" do
    visit ('/')
    fill_in :user_name, with: 'Chuka'
    fill_in :email, with: 'abc@efg.com'
    fill_in :password, with: '1234'
    click_button ('sign up')
    expect(page).to have_content('Welcome Chuka!')
    users = User.all
    expect(users.count).to eq(1)
    user = User.first
    expect(user.email).to eq('abc@efg.com')
  end
end
