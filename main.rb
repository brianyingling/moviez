require 'pry'
require 'pg'
require 'httparty'
require 'JSON'


conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
conn.exec( "select * from moviez" ) do |result|
  result.each do |row|
  end
end

print 'Enter a movie name: '
title = gets.chomp

movie = HTTParty.get("http://www.omdbapi.com/?t=#{title.split.join('+')}")

movie_formatted = JSON(movie.body)
puts movie_formatted

movie_values = movie_formatted.map {|key, value| field = "\'#{value}\'"}
binding.pry
sql = "insert into moviez(#{movie_formatted.keys.join(', ')}) values (#{movie_values.join(', ')})"

#sql = "insert into moviez(#{}) values (movie['Title')"
conn.exec(sql)

conn.close