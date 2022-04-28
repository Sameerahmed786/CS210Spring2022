drop database musicboi;
create database if not exists musicboi;
use musicboi;


create table if not exists Artist(

thename varchar(50),

primary key(thename));

create table if not exists Album(
thename varchar(50),
artist_name varchar(50), 
released_on_date datetime,
primary key(thename),
foreign key(artist_name) references Artist(thename));

create table if not exists Song(
title varchar(50), 
artist_name varchar(50), 
release_date datetime, 
album_name varchar(50),
primary key(title, artist_name),
foreign key(artist_name) references Album(artist_name)); -- need to check that reference

create table if not exists Genre(
thename varchar(50),
primary key(thename));

create table if not exists Song_Genre(
song_title varchar (50), 
genre_name varchar(50),
foreign key(song_title, genre_name) references Song(title, artist_name));

create table if not exists Song_user(
username varchar(50),
primary key (username));

create table if not exists Playlist(
title varchar(50), 
song_title varchar(50), 
created_date datetime,
primary key(title, created_date),
foreign key(song_title) references Song(title));

create table if not exists Rating(
username varchar(50), 
thename varchar(50), 
rating int,
foreign key (thename) references Artist(thename),
foreign key (username) references Song_user(username));