require 'sinatra/base'
require_relative 'datamapper_setup'

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
    link = Link.new(:url => params[:url], :title => params[:title])
    tag = Tag.create(:name => params[:tags])
    link.tags << tag
    link.save
    redirect('/links')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
