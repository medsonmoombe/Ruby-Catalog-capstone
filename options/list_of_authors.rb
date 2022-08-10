# Show the list of all authors in the database.
require './author'

def list_all_authors
  puts 'List of authors:'
  puts ''
  puts 'ID  Name
        ----------------------------------------'
  Author.all.each do |author|
    puts "#{author.id}  #{author.name}"
  end
  puts ''
end
