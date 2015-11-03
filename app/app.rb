require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:views)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    Link.create(:url => params[:url], :title => params[:title])
    @links = Link.all
    redirect('/links')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
