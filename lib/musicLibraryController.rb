class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
    input = ""
    while input != "exit"
      puts("To list all of your songs, enter 'list songs'.")
      puts("To list all of the artists in your library, enter 'list artists'.")
      puts("To list all of the genres in your library, enter 'list genres'.")
      puts("To list all of the songs by a particular artist, enter 'list artist'.")
      puts("To list all of the songs of a particular genre, enter 'list genre'.")
      puts("To play a song, enter 'play song'.")
      puts("To quit, type 'exit'.")
      puts("What would you like to do?")

      input = gets.strip
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        name = gets.strip
        self.list_songs_by_artist
        # puts Artist.all.find { |obj| obj.name == name }.songs
      elsif input == "list genre"
        name = gets.strip
        self.list_songs_by_genre
        # puts Genre.all.find { |obj| obj.name == name }.songs
      elsif input == "play song"
        self.play_song
        # puts "Playing a song"
      end
    end
  end

  def list_songs
    songs = Song.all.sort_by { |obj| obj.name }
    songs.each_with_index { |o, i| puts "#{i + 1}. #{o.artist.name} - #{o.name} - #{o.genre.name}" }
  end

  def list_artists
    artists = Artist.all.sort_by { |obj| obj.name }
    artists.each_with_index { |o, i| puts "#{i + 1}. #{o.name}" }
  end

  def list_genres
    genres = Genre.all.sort_by { |obj| obj.name }
    genres.each_with_index { |o, i| puts "#{i + 1}. #{o.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
        artist_songs = artist.songs.sort_by {|obj| obj.name}
        artist_songs.each_with_index {|obj, i| puts "#{i+1}. #{obj.name} - #{obj.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
        genre_songs = genre.songs.sort_by {|obj| obj.name}
        genre_songs.each_with_index {|obj, i| puts "#{i+1}. #{obj.artist.name} - #{obj.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    
    if (1..Song.all.count).include?(input)
        selection = Song.all.sort_by { |obj| obj.name }[input - 1]
        puts "Playing #{selection.name} by #{selection.artist.name}"
    else
        "No song found"
    end
  end
end
