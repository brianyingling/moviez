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

sql = "insert into people (name) values (movie_formatted)"
conn.exec(sql)

conn.close