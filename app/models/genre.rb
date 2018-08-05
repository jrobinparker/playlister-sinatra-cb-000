class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    genre_name = self.name.downcase
    split_name = genre_name.gsub(/\s+/m, ' ').strip.split(" ")
    slugify = split_name.join("-")
    slugify
  end

end
