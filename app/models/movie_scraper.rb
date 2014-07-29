require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1'))
@movies = {}
doc.css(".overview-top").each do |movie|
	genres = []
	title = movie.children[1].children.children.text
	rating = movie.children[3].children[1].attributes["title"].value
	duration = movie.children[3].children[3].children.text
	movie.children[3].css("span").each do |genre|
		genres << genre.children.text unless genre.children.text == "|"
	end
	metarating = 
end
