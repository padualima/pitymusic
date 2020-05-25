class Category < ApplicationRecord
  #associations
  has_many :albums
  has_one_attached :image

  #validates
  validates :name, presence: true

  #scops

  scope :artists, -> {
    Artist.joins(:albums).where(albums: { self.albums.ids }).distinct
  }
  scope :songs, -> {
    Song.joins(:album).where(songs: { id: self.albums.ids }).distinct
  }
end
