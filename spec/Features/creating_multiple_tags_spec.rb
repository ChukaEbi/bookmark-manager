feature 'creating multiple tags' do
  scenario 'Adding multiple tags to a link' do
    create_link('http://www.whufc.com','West Ham Homepage','Sports News')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Sports','News')
    expect(page).to have_content('Sports, News')
  end
end
