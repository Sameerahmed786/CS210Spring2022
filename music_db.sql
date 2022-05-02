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
	album_title varchar(50),
	constraint song_fk_artist
		foreign key(artist_name) 
        references Artist(artist_name),
	constraint song_fk_album
		foreign key(album_title)
        references Album(album_title)
	
);

create table Single
(
	song_title varchar(50),
    release_date date,
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
	created_date date,
    constraint playlist_fk_musicuser
		foreign key(username)
        references MusicUser(username)
);

create table PlaylistSongs 
(
	playlist_title varchar(50),
    song_title varchar(50),
    constraint playlistsongs_fk_playlist
		foreign key(playlist_title)
        references Playlist(playlist_title),
	constraint playlistsongs_fk_song
		foreign key(song_title) 
        references Song(song_title)
);

create table SongRating
(
	username varchar(50),
    song_title varchar(50),
	rating int,
    rating_date date,
    constraint songrating_fk_musicuser
		foreign key(username)
        references MusicUser(username),
	constraint songrating_fk_song
		foreign key (song_title)
        references Song(song_title)
);

create table AlbumRating
(
	username varchar(50),
    album_title varchar(50),
    rating int,
    rating_date date,
    constraint albumrating_fk_musicuser
		foreign key(username)
        references MusicUser(username),
	constraint albumrating_fk_album
		foreign key(album_title)
        references Album(album_title)
);

create table PlaylistRating
(
	username varchar(50),
    playlist_title varchar(50),
    rating int,
    rating_date date,
    constraint playlistrating_fk_playlist
		foreign key(username)
        references MusicUser(username),
	constraint playlistrating_fk_album
		foreign key(playlist_title)
        references Playlist(playlist_title)
);

------------------------------
-- Queries --

-- 1
SELECT g.genre_name AS 'genre', COUNT(s.song_title) AS 'number_of_songs'
FROM Song_Genre g join Song s
on g.song_title = s.song_title
group by g.genre_name
order by number_of_songs desc
limit 3;

-- 2


-- 3
select a.album_title AS 'album_name', avg(r.rating) AS 'number_of_song_ratings'
from Album a join AlbumRating r
on a.album_title = r.album_title
where rating_date >= '1990-01-01' and rating_date <= '1999-12-31'
group by a.album_title
order by rating desc
limit 10;

-- 4
-- Incorrect
select genre_name, count(sr.rating) as 'number_of_song_ratings'
from SongRating sr
left join Song_Genre sg on sg.genre_name = sg.song_title
union
select genre_name, count(sr.rating) as 'number_of_song_ratings'
from SongRating sr
right join Song_Genre sg on sg.genre_name = sg.song_title
where rating_date >= '1991-01-01' and rating_date <= '1995-12-31'
group by genre_name
order by number_of_song_ratings desc
limit 3;

-- 5

-- # 6
select username, sum(eng.MostEngagedUsers)
from
(
	select username, count(username) as MostEngagedUsers
    from SongRating 
    group by username
    UNION ALL
    select username, count(username) as MostEngagedUsers from AlbumRating group by username
)eng group by username
limit 5;

-- # 7
select s.artist_name, count(s.song_title) as number_of_songs
from Artist a join Song s
on a.artist_name = s.artist_name
where release_date >= '1990-01-01' and release_date <= '1999-12-31'
group by s.artist_name
order by number_of_songs desc
limit 10;

-- # 8
select song_title, count(song_title) as number_of_playlists
from PlaylistSongs 
group by song_title
order by number_of_playlists desc
limit 10;

-- # 9
select sg.song_title, s.artist_name, count(sg.song_title) as number_of_ratings
from Single sg 
	join Song s
		on sg.song_title = s.song_title
	join Artist a
		on s.artist_name = s.artist_name
	join SongRating sr
		on s.song_title = sr.song_title
	where sg.song_title = sr.song_title
    group by song_title;

-- # 10
select a.artist_name as artist_title
from Artist a
	join Song s
		on s.artist_name = a.artist_name
where s.release_date <= '1993-12-31'
group by s.artist_name;


