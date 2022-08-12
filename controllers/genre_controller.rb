require 'json'
require_relative '../classes/genre'

# Manage list of genres
module GenreController
  def add_genre
    puts 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    puts 'Genre successfully added!'
  end

  def list_genre
    if @genres.empty?
      puts 'No genres present yet'
    else
      @genres.each do |genre|
        puts "#{genre.class} Name: #{genre.name}"
      end
    end
  end

  def access_genre
    genre_arr = []
    genre_file = open('./data/genre.json')
    if File.exist?(genre_file) && File.read(genre_file) != ''
      data = genre_file.read
      JSON.parse(data).each { |genre| genre_arr.push(Genre.new(genre['name'])) }
    else
      File.write(genre_file, '[]')
    end
    genre_arr
  end

  def save_genre
    genre_arr = []
    @genres.each do |genre|
      genre_arr << { name: genre.name }
    end
    File.write('./data/genre.json', genre_arr.to_json)
  end
end
