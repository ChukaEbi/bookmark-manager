feature 'filtering multiple tags' do
  scenario 'when several tags, searching by tag' do
    sign_up
    create_link('http://www.whufc.com','West Ham Homepage','Sports')
    create_link('http://www.facebook.com','Facebook','Social network')
    create_link('http://www.twitter.com','Twitter','Social network')
    create_link('http://www.lequipe.fr','L\'equipe','Sports')
    click_button('Filter by tag')
    fill_in(:search_tag , with: 'Sports')
    click_button('Search')
    expect(page).not_to have_content('Twitter')
    expect(page).not_to have_content('Facebook')
    expect(page).to have_content('West Ham')
    expect(page).to have_content('L\'equipe')
  end
end
