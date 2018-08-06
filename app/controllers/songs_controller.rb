class SongsController < ApplicationController

  get '/' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
      if !params["artist"]["name"].empty?
        @song.artists << Artist.create(name: params["artist"]["name"])
      elsif params[:genre][:name] != ""
        new_genre = Genre.create(params[:genre])
        SongsGenre.create(genre_id: new_genre.id, song_id: @song.id)
      end
    redirect to "songs/#{@song.id}"
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'/songs/show'
  end

end
