class Artist
    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        obj = self.new(name)
        obj.save
        self
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end

    def genres
        @songs.collect {|obj| obj.genre}.uniq
    end

    # attr_accessor :name 
    # attr_writer :songs

    # @@all = []

    # def initialize(name)
    #     @name = name
    #     @songs = []
    #     self.save
    # end

    # def save
    #     self.class.all.push(self)        
    # end

    # def self.create(name)
    #     self.new(name).tap {|obj|
    #         obj.save
    #     }
    # end

    # def self.all
    #     @@all
    # end

    # def self.destroy_all
    #     self.all.clear
    # end

    # def songs
    #     Song.all.select {|song| song.artist == self}
    #     @songs
    # end

    # def add_song(song)
    #     # if song.artist == nil && song.class == Song
    #         song.artist = self
    #         @songs.push(song)
    #     # end
    # end

    # def genres
    #     self.songs.collect{|obj| obj.genre}.uniq
    # end

    # def self.find_by_name(name)
    #     self.all.find {|obj| obj.name == name}
    # end
    
end