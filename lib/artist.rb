require 'pry'
require_relative '../lib/concerns/memorable'


class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Paramable::InstanceMethods
  extend Memorable::InstanceMethods

  @@artists = []

    def initialize
      super
      @songs = []
    end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
