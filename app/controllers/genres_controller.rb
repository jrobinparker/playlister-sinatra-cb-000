class GenresController < ApplicationController

  get '/' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/new' do
    @artists = Artist.all
    erb :'/genres/new'
  end

  post '/genres' do
    @genre = Genre.create(params[:genre])
    redirect to "genres/#{@genre.id}"
  end

  get '/:id' do
    @genre = Genre.find(params[:id])
    erb :'/genres/show'
  end

end
