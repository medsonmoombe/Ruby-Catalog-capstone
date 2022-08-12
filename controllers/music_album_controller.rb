# require 'pry'
require 'json'
require_relative '../classes/music_album'

module MusicAlbumsModule
  def add_music_album(music_album)
    music_album_db = './data/music_album.json'
    music_albums = []
    new_music_album = {
      'publish_date' => music_album.publish_date,
      'on_spotify' => music_album.on_spotify,
      'archived' =>  music_album.archived
    }

    music_albums = JSON.parse(File.read(music_album_db)) if File.exist?(music_album_db)

    music_albums << new_music_album
    File.write(music_album_db, JSON.pretty_generate(music_albums))
  end

  def fetch_music_albums
    music_album_db = './data/music_album.json'
    music_albums = []

    if File.exist?(music_album_db)
      if File.empty?(music_album_db)
        music_albums
      else
        JSON.parse(File.read(music_album_db))
      end
    else
      music_albums
    end
  end

  def list_all_music_albums
    music_albums = fetch_music_albums

    if music_albums.empty?
      puts 'No Music Album to be displayed'
    else
      music_albums.each do |album|
        puts "Album's published date : #{album['publish_date']}"
        puts "The album is #{album['on_spotify'] ? '' : 'not'} on spotify"
        puts "Archived - #{album['archived']}"
        puts "______________________________________________"
      end
    end
  end

  def create_music_album
    print 'Enter Date Published format[yyyy-mm-dd]: '
    publish_date = gets.chomp

    print 'Do you want it to be on spotify?(y/n): '
    on_spotify = gets.chomp
    on_spotify = on_spotify.casecmp?('y')

    puts 'Is it archived? (y/n)'
    archived = gets.chomp.to_s.downcase != 'y'

    music_album = MusicAlbum.new(publish_date, on_spotify, archived)

    add_music_album(music_album)
    
    puts 'Music Album Added successfully'
  rescue StandardError
     music_albums = []
  end

   def save_music_album
    data = []
    @items.each do |music_album|
      data.push({ on_spotify: music_album.on_spotify, archived: music_ablum.archived,
                  publish_date: music_album.publish_date })
    end
    File.write('./data/music_ablum.json',a+, JSON.generate(data))
  end
end