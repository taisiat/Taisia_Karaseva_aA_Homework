# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  def n_plus_one_tracks
    my_albums = self.albums
    track_counts = {}
    my_albums.each do |album|
      track_counts[album.title] = album.tracks.length
    end

    track_counts
  end

  def better_tracks_query #does not work :(
    my_albums = self.albums.includes(:tracks)
    album_track_counts = {}
    
    my_albums.each do |album|
      album_track_counts[album] = my_albums.tracks.length
    end

    album_track_counts
  end
end