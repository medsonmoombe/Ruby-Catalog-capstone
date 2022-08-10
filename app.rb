require './utils/options'

class App
  def initialize
    @options = Options.new
  end

  def run
    puts '     Welcome to      '
    puts '  Catalog Of Things  '
    puts ''

    loop do
      @options.show_menu
      print 'Option: '
      option = gets.chomp
      exit if option == '13'
      @options.menu_options(option)
      @options.save_label
      @options.save_book
    end
    puts 'Bye'
  end
end
