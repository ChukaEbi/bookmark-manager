def create_link(url,title,tag)
  click_button('Add link')
  fill_in :url, with: url
  fill_in :title, with: title
  fill_in :tags, with: tag
  click_button 'Submit'
end

def sign_up(user_name='aha', email='aha@aah.com',password='11')
  visit ('/')
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  click_button ('sign up')
end
