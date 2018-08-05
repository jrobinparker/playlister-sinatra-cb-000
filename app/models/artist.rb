class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    artist_name = self.name.downcase
    split_name = artist_name.gsub(/\s+/m, ' ').strip.split(" ")
    slugify = split_name.join("-")
    slugify
  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub('-', ' ')
    @artist = Artist.find_by(name: artist_name)
    @artist.name
  end

end
