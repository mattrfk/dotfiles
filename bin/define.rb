#!/usr/bin/env ruby

require 'nokogiri'
require 'pry'
require 'open-uri'

URL = 'https://www.etymonline.com'
SEARCH = '/search?q='

if ARGV.length < 1
  # puts "give me an argument"
  # URL << gets.chomp
  SEARCH << "test"
else
  SEARCH << ARGV.first
end

doc = Nokogiri::HTML(open(URL + SEARCH))

a = doc.css('a')

titles = a.select do |t| 
  t['class'] and (
  t['class'].start_with?('word__name') or
  t['class'].start_with?('word--'))
end

def get_index(titles)
  titles.each_with_index do |t, i|
    printf("%3d) %s\n", i+1, t.text)
  end

  puts "select a word (#{1}-#{titles.length}): "
  index = gets.chomp.to_i - 1
  if index < 0 or index >= titles.length
    puts "invalid number"
    get_index(titles)
  else
    return index
  end
end

i = get_index(titles)
puts titles[i]['href']
