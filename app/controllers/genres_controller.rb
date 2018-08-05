class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do
    @artists = Artist.all
    erb :'/genres/new'
  end

  post '/genres' do
    @genre = Genre.create(params[:genre])
      if !params["song"]["name"].empty?
        @genre.songs << Song.create(name: params["song"]["name"])
      elsif params[:artist][:name] != ""
        new_artist = Artist.create(params[:artist])
        ArtistGenre.create(artist_id: new_artist.id, genre_id: @genre.id)
      end
    redirect to "genre/#{@genre.id}"
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :'/genres/show'
  end

end
