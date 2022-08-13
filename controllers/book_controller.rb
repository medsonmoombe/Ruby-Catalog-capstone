require 'json'
require 'date'
require_relative '../classes/book'

# Manage list of books
module BookController
  def add_book
    puts 'publisher'
    publisher = gets.chomp
    puts 'publish Date [yy-mm-dd]:'
    publish_date = gets.chomp
    puts 'cover status'
    cover_state = gets.chomp
    book = Book.new(publisher, publish_date, cover_state)
    @books << book
    puts 'Book successfully added'
  end

  def list_book
    if @books.empty?
      puts 'No book present yet'
    else
      @books.each do |book|
        puts "publisher: #{book.publisher}, publish date: #{book.publish_date}, cover state: #{book.cover_state} "
      end
    end
  end

  def load_book
    book_store = []
    book_file = open('./data/book.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = book_file.read
      JSON.parse(data).each do |book|
        book_store.push(Book.new(book['publisher'], book['publish_date'], book['cover_state']))
      end
    end
    book_store
  end

  def save_book
    data = []
    @books.each do |book|
      data.push({ publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.write('./data/book.json', JSON.generate(data))
  end
end
