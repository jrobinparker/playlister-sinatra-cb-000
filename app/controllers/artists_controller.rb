class ArtistsController < ApplicationController

  get '/' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/new' do
    @genres = Genre.all
    erb :'/artists/new'
  end

  post '/artists' do
    @artist = Artist.create(params[:artist])
      if !params[:song][:name] != ""
        @artist.songs << Song.create(name: paramras["song"]["name"])
      elsif params[:genre][:name] != ""
        new_genre = Genre.create(params[:genre])
        ArtistGenre.create(genre_id: new_genre.id, artist_id: @artist.id)
      end
    redirect to "artist/#{@artist.id}"
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :'/artists/show'
  end

end
