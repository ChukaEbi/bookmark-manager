require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/user_sign_up' do
    User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @user = User.first
    erb(:views)
  end

  get '/links/new' do
    erb(:new_link)
  end

  get '/links/filter' do
    erb(:filter)
  end

  post '/links/filter' do
    redirect "/tags/#{params[:search_tag]}"
  end

  get "/tags/:search_tag" do
    tag = Tag.all(name: params[:search_tag])
    @links = tag ? tag.links : []
    erb(:views)
  end

  post '/links' do
    link = Link.new(:url => params[:url], :title => params[:title])
    params[:tags].split(' ').each  do |elements|
      tag = Tag.create(:name => elements)
      link.tags << tag
    end
    link.save
    redirect('/links')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
