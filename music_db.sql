drop database if exists musicboi;
create database musicboi;
use musicboi;


create table Artist
(
	artist_name varchar(50) primary key
);

create table Album
(
	album_title varchar(50) primary key,
	artist_name varchar(50), 
	released_on_date datetime,
	constraint album_fk_artist
		foreign key(artist_name) 
        	references Artist(artist_name)
);

create table Song
(
	song_title varchar(50) primary key, 
	artist_name varchar(50), 
	release_date datetime, 
	album_name varchar(50),
	constraint song_fk_artist
		foreign key(artist_name) 
        	references Album(artist_name)
);

create table Genre(
	genre_name varchar(50) primary key
);

create table Song_Genre
(
	song_title varchar (50), 
	genre_name varchar(50),
	constraint song_genre_fk_song
		foreign key(song_title) 
        	references Song(song_title),
	constraint song_genre_fk_genre
		foreign key (genre_name)
        	references Genre(genre_name)
);

create table MusicUser
(
	username varchar(50) primary key
);

create table Playlist
(
	username varchar(50),
	playlist_title varchar(50) primary key, 
	song_title varchar(50), 
	created_date datetime,
	constraint playlist_fk_musicuser
		foreign key(username)
		references MusicUser(username),
	constraint playlist_fk_song
		foreign key(song_title) 
        	references Song(song_title)
);

create table Rating
(
	username varchar(50), 
	album_title varchar(50),
	song_title varchar(50),
	playlist_title varchar(50),
	rating int,
	constraint rating_fk_album
		foreign key (album_title)
        	references Album(album_title),
	constraint rating_fk_song
		foreign key (song_title)
		references Song(song_title),
	constraint rating_fk_playlist
		foreign key (playlist_title)
        	references Playlist(playlist_title)
);
