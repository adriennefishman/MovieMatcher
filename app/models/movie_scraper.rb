require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1'))

doc.css(".overview-top").each do |movie|
  title       = movie.children[1].children.children.text[1..-7]
  rating      = movie.children[3].children[1].attributes["title"].value
  duration    = movie.children[3].children[3].children.text
  genres      = movie.children[3].css("span").children.text.split('|')[0..-1]



  description = movie.children[7].children.text.gsub("\n", "").strip
  director    = movie.children[9].children.children.children.children.text
  actors      = movie.children[11].children.children.children.text.split("\n")[1..-1]
  # binding.pry
  image_url = movie.parent.search("img").last.attributes["src"].value

  puts "title: #{title}"
  puts "rating: #{rating}"
  puts "duration: #{duration}"
  puts "genres: #{genres}"
  puts "description: #{description}"
  puts "director: #{director}"
  puts "actors: #{actors}"
  puts "image_url: #{image_url}"

end
