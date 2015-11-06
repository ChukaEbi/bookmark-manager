require 'spec_helper'

feature "new user signs up" do
  scenario "user wants to have a bookmark page" do
    sign_up
    expect(page).to have_content('Welcome aha!')
    users = User.all
    expect(users.count).to eq(1)
    user = User.first
    expect(user.email).to eq('aha@aah.com')
  end
end
