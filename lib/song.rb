class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil && artist.class == Artist
            self.artist = artist
        end
        if genre != nil && genre.class == Genre
            self.genre = genre
        end
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.find {|obj| obj.name == name}
        # @@all.find {|obj| obj.name == name}.class
    end

    def self.find_or_create_by_name(name)
        found = self.find_by_name(name)
        found ? found : self.create(name)
    end

    # attr_reader :artist, :genre

    # @@all = []

    # def self.all
    #     @@all
    # end

    # def initialize(name, artist = nil, genre = nil)
    #     @name = name
    #     if artist != nil && artist.class == Artist
    #         @artist = artist
    #     end
    #     if genre!= nil && genre.class == Genre
    #         @genre = genre
    #     end
    #     artist.add_song(self)
    #     genre.add_song(self)
    #     self.save
    # end

    # def artist=(artist)
    #     if self.artist == nil && artist.class == Artist
    #         @artist = artist
    #         artist.add_song(self)
    #     end
    # end

    # def genre=(genre)
    #     if @genre == nil && genre.class == Genre
    #         genre.songs.push(self)
    #         @genre = genre
    #     end
    # end

    # def save
    #     @@all.push(self)
    # end

    # def self.destroy_all
    #     @@all.clear
    # end
    
    # def self.create(name)
    #     # self.new(name)
    #     self.new(name).tap {|obj|
    #         obj.save
    #     }
    # end

    # def self.find_by_name(name)
    #     @@all.find {|obj| obj.name == name}
    # end

end