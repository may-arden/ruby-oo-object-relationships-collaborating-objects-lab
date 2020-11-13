class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path 
    end 

    def files
        #loads all of the mp3 files in the path directory & normalizes the filename to just the mp3 filename with no path
        # using #.glob and enumerator .collect & .gsub 
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end 

    def import
        # imports the files into the library by creating songs from a filename using the iterator .each
        # calling the Class Song with its #new_by_filename method -- Song.new_by_filename
        # iterating over each file
        files.each{|f| Song.new_by_filename(f)}
    end 

end
