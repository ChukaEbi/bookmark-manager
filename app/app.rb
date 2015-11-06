require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions 
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  post '/user_sign_up' do
    user = User.new(user_name: params[:user_name],
                email: params[:email],
                password: params[:password])
    user.save!
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
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
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(' ').each  do |elements|
      tag = Tag.first_or_create(name: elements)
      link.tags << tag
    end
    link.save
    redirect('/links')
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
 end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
