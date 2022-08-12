# require 'pry'
require 'json'
require_relative '../classes/music_album'

module MusicAlbumController
  def add_music_album
    puts 'publish Date [yy-mm-dd]:'
    publish_date = gets.chomp
    puts 'Do you want it to be on Spotify?(y/n):'
    on_spotify = gets.chomp
    on_spotify = on_spotify.casecmp?('y')
    puts 'Is it archived? (y/n)'
    archived = gets.chomp.to_s.downcase != 'y'
    music_album = MusicAlbum.new(publish_date, on_spotify, archived)
    @items << music_album
    puts 'Music Album successfully added'
  end

  def list_music_album
    if @items.empty?
      puts 'No music_album present yet'
    else
      @items.each do |music_album|
        puts ": publish date: #{music_album.publish_date}, on spotify : #{music_album.on_spotify}, archived: #{music_album.archived} "
      end
    end
  end

  def load_music_albums
    music_album_store = []
    music_album_file = open('./data/music_album.json')
    if File.exist?(music_album_file) && File.read(music_album_file) != ''
      data = music_album_file.read
      JSON.parse(data).each do |music_album|
        music_album_store.push(MusicAlbum.new(music_album['on_spotify'], music_album['publish_date'],
                                              music_album['archived']))
      end
    end
    music_album_store
  end

  def save_music_album
    data = []
    @items.each do |music_album|
      data.push({ archived: music_album.archived, on_spotify: music_album.on_spotify,
                  publish_date: music_album.publish_date })
    end
    File.write('./data/music_album.json', JSON.generate(data))
  end
end
