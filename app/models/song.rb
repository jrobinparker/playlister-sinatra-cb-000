class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    song_name = self.name.downcase
    split_name = song_name.gsub(/\s+/m, ' ').strip.split(" ")
    slugify = split_name.join("-")
    slugify
  end

end
