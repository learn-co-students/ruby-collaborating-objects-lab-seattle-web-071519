require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        files = Dir.glob("#{path}/*.mp3")
        files.collect do |file|
            file_array = file.split("#{path}/")
            file_array[1]
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end