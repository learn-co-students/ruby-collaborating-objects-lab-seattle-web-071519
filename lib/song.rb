require 'pry'

class Song
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
    end

    def self.new_by_filename(file)
        # assign artist and song_title at the same time, split up the file on the dash to break into array of artist name, song title
        artist, song_title = file.split(" - ")
        #create a new song instance using the song title
        song = self.new(song_title)
        #calling our helper method setter method artist_name and setting it equal to the artist variable
        song.artist_name = artist
        #returning the song instance
        song
    end

    def artist_name=(name)
        #sets the artist attached to the song instance to the result of calling the 
        #find method or create method (if the artist exists, the find method will bring back
        # the artist instance, if they don't exist the create method creates an artist instance for them)
        self.artist = Artist.find_or_create_by_name(name)
        #calling the add song method on the artist instance and throwing the song instance in
        artist.add_song(self)
    end

    
end