require 'json'
require_relative '../classes/label'

# Manage list of labels
module LabelController
  def add_label
    puts 'Add title: '
    title = gets.chomp
    puts 'Add color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    puts 'Label successfully added!'
  end

  def list_label
    if @labels.empty?
      puts 'No labels present yet'
    else
      @labels.each do |label|
        puts "#{label.class} Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def access_label
    label_arr = []
    label_file = open('./data/label.json')
    if File.exist?(label_file) && File.read(label_file) != ''
      data = label_file.read
      JSON.parse(data).each { |label| label_arr.push(Label.new(label['title'], label['color'])) }
    else
      File.write(label_file, '[]')
    end
    label_arr
  end

  def save_label
    label_arr = []
    @labels.each do |label|
      label_arr << { title: label.title, color: label.color }
    end
    File.write('./data/label.json', label_arr.to_json)
  end
end
