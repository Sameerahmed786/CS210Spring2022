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
	released_on_date date,
	constraint album_fk_artist
		foreign key(artist_name) 
        references Artist(artist_name)
);

create table Song
(
	song_title varchar(50) primary key, 
	artist_name varchar(50), 
	release_date date, 
	album_name varchar(50),
	constraint song_fk_artist
		foreign key(artist_name) 
        references Album(artist_name)
);

create table Single
(
	song_title varchar(50),
    constraint single_fk_song
		foreign key(song_title)
        references Song(song_title)
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
	created_date date,
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

-- Delete code from here to....

insert into Artist values
('Opeth'),
('Between the Buried and Me'),
('Mastodon'),
('John Mayer'),
('Metallica'),
('Gojira'),
('Led Zeppelin'),
('Black Sabbath'),
('Nirvana'),
('Pearl Jam'),
('Alice in Chains'),
('Pantera');

insert into Album values
('Blackwater Park', 'Opeth', '2001-03-12'),
('Still Life', 'Opeth', '1999-10-18'),
('Colors', 'Between the Buried and Me', '2007-09-18'),
('Colors II', 'Between the Buried and Me', '2021-08-20'),
('Leviathan', 'Mastodon', '2004-08-31'),
('Crack the Skye', 'Mastodon', '2009-03-24'),
('Remission', 'Mastodon', '2002-05-28'),
('Continuum', 'John Mayer', '2006-09-11'),
('Room for Squares', 'John Mayer', '2001-08-16'),
('Metallica', 'Metallica', '1991-08-12'),
('Load', 'Metallica', '1996-06-04'),
('Reload', 'Metallica', '1997-11-18'),
('From Mars to Sirius', 'Gojira', '2005-09-07'),
('Led Zeppelin III', 'Led Zeppelin', '1970-10-05'),
('Led Zeppelin IV', 'Led Zeppelin', '1971-11-08'),
('Black Sabbath', 'Black Sabbath', '1970-02-13'),
('Paranoid', 'Black Sabbath', '1970-09-18'),
('Nevermind', 'Nirvana', '1991-09-26');
