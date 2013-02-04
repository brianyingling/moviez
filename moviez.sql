#####
SQL tables

create table moviez
(
  id serial2 not null,
  title varchar(50) not null,
  year char(4),
  released varchar(20),
  runtime varchar(20),
  genre varchar(50),
  director varchar(50),
  writer varchar(100),
  actors varchar(150),
  plot text,
  poster varchar(200),
  rating varchar(4),
  imdbVotes varchar(10)
  imdbID varchar(15),
  response bool
);
