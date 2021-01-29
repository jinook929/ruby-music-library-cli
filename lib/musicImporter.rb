class MusicImporter
    attr_accessor :path
    def initialize(path = "./db/mp3s")
        @path = path
    end

    def files
        Dir.entries(@path).select {|file| file.match(/^.+ - .+ - .+.mp3$/)}
    end

    def import
        self.files.each {|obj| Song.create_from_filename(obj)}
    end
end