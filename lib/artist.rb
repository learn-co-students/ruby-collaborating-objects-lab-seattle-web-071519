require 'pry'

class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        self.songs << song
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find_or_create_by_name(name)
        #if self.find(name) doesn't return anything then execute code on the left (call the create method),
        # otherwise return the value of the find method
        !self.find(name) ? self.create(name) : self.find(name)
    end

    ## finds the artist
    def self.find(name)
        self.all.find do |artist|
            artist.name == name
        end
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end