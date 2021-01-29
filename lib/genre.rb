class Genre
    extend Concerns::Findable

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
        obj
    end

    def songs
        @songs
    end

    def artists
        @songs.collect {|obj| obj.artist}.uniq
    end

    # @@all = []
    # def self.all
    #     @@all
    # end

    # def self.destroy_all
    #     self.all.clear
    # end
    
    # def self.create(name)
    #     self.new(name).tap {|obj|
    #         obj.save
    #     }
    # end

    # attr_accessor :name
    # attr_writer :songs
    # def initialize(name)
    #     @name = name
    #     @songs = []
    #     self.save
    # end

    # def save
    #     self.class.all.push(self)
    # end

    # def songs
    #     Song.all.select {|obj| obj.genre == self}
    #     @songs
    # end

    # def add_song(song)
    #     # if song.genre == nil && song.class == Song
    #         song.genre = self
    #         @songs.push(song)
    #     # end
    # end

    # def artists
    #     self.songs.collect {|obj| obj.artist}.uniq
    # end

    # def self.find_by_name(name)
    #     self.all.find {|obj| obj.name == name}
    # end

end