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
    constraint playlistrating_fk_playlist
		foreign key(username)
        references MusicUser(username),
	constraint playlistrating_fk_album
		foreign key(playlist_title)
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
('Room For Squares', 'John Mayer', '2001-08-16'),
('Metallica', 'Metallica', '1991-08-12'),
('Load', 'Metallica', '1996-06-04'),
('From Mars to Sirius', 'Gojira', '2005-09-07'),
('Led Zeppelin III', 'Led Zeppelin', '1970-10-05'),
('Paranoid', 'Black Sabbath', '1970-09-18'),
('Nevermind', 'Nirvana', '1991-09-26'),
('Ten', 'Pearl Jam', '1991-08-27'),
('Dirt', 'Alice in Chains', '1992-09-29'),
('Cowboys from Hell', 'Pantera', '1990-07-20'),
('Far Beyond Driven', 'Pantera', '1994-03-22'),
('Vs.', 'Pearl Jam', '1993-08-19'),
('Vitalogy', 'Pearl Jam', '1994-11-22'),
('In Utero', 'Nirvana', '1993-09-21'),
('Facelife', 'Alice in Chains', '1990-08-01');

insert into Song values
('The Leper Affinity', 'Opeth', '2001-03-12', 'Blackwater Park'),
('Bleak', 'Opeth', '2001-03-12', 'Blackwater Park'),
('Harvest', 'Opeth', '2001-03-12', 'Blackwater Park'),
('The Drapery Falls', 'Opeth', '2001-03-12', 'Blackwater Park'),
('Dirge for November', 'Opeth', '2001-03-12', 'Blackwater Park'),
('The Funeral Portrait', 'Opeth', '2001-03-12', 'Blackwater Park'),
('Paterns in the Ivy', 'Opeth', '2001-03-12', 'Blackwater Park'),
('Blackwater Park', 'Opeth', '2001-03-12', 'Blackwater Park'),
('The Moor', 'Opeth', '1999-10-19', 'Still Life'),
('Godhead\'s Lament', 'Opeth', '1999-10-19', 'Still Life'),
('Benighted', 'Opeth', '1999-10-19', 'Still Life'),
('Moonlapse Vertigo', 'Opeth', '1999-10-19', 'Still Life'),
('Face Of Melinda', 'Opeth', '1999-10-19', 'Still Life'),
('Serenity Painted Death', 'Opeth', '1999-10-19', 'Still Life'),
('White Cluster', 'Opeth', '1999-10-19', 'Still Life'),
('Foam (A) the Backtrack', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('(B) The Decade Of Statues', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Informal Gluttony', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Sun of Nothing', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Ants Of The Sky', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Prequel To The Sequel', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Viridian', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('White Walls', 'Between the Buried and Me', '2007-09-18', 'Colors'),
('Monochrome', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('The Double Helix of Extinction', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Revolution in Limbo', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Fix The Error', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Never Seen / Future Shock', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Stare Into The Abyss', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Prehistory', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Bad Habits', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('The Future Is Behind Us', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Turbulent', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Sfumato', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Human Is Hell (Another One With Love)', 'Between the Buried and Me', '2021-08-20', 'Colors II'),
('Blood and Thunder', 'Mastodon', '2004-08-31', 'Leviathan'),
('I Am Ahab', 'Mastodon', '2004-08-31', 'Leviathan'),
('Seabeast', 'Mastodon', '2004-08-31', 'Leviathan'),
('Island', 'Mastodon', '2004-08-31', 'Leviathan'),
('Iron Tusk', 'Mastodon', '2004-08-31', 'Leviathan'),
('Megalodon', 'Mastodon', '2004-08-31', 'Leviathan'),
('Naked Burn', 'Mastodon', '2004-08-31', 'Leviathan'),
('Aqua Dementia', 'Mastodon', '2004-08-31', 'Leviathan'),
('Hearts Alive', 'Mastodon', '2004-08-31', 'Leviathan'),
('Joseph Merric - Instrumental', 'Mastodon', '2004-08-31', 'Leviathan'),
('Oblivion', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('Divinations', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('Quintessence', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('The Czar:Usurper / Escape / Martyr / Spiral', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('Ghost of Karelia', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('Crack the Skye', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('The Last Baron', 'Mastodon', '2009-03-24', 'Crack the Skye'),
('Crusher Destroyer', 'Mastodon', '2002-05-28', 'Remission'),
('March of the Fire Ants', 'Mastodon', '2002-05-28', 'Remission'),
('Where Strides the Behemoth', 'Mastodon', '2002-05-28', 'Remission'),
('Workhorse', 'Mastodon', '2002-05-28', 'Remission'),
('Ol\'e Nessie', 'Mastodon', '2002-05-28', 'Remission'),
('Burning Man', 'Mastodon', '2002-05-28', 'Remission'),
('Trainwreck', 'Mastodon', '2002-05-28', 'Remission'),
('Trampled Under Hoof', 'Mastodon', '2002-05-28', 'Remission'),
('Trilobite', 'Mastodon', '2002-05-28', 'Remission'),
('Mother Puncher', 'Mastodon', '2002-05-28', 'Remission'),
('Elephant Man', 'Mastodon', '2002-05-28', 'Remission'),
('Waiting On the World to Change', 'John Mayer', '2006-09-11', 'Continuum'),
('I Don\'t Trust Myself (With Loving You)', 'John Mayer', '2006-09-11', 'Continuum'),
('Belief', 'John Mayer', '2006-09-11', 'Continuum'),
('Gravity', 'John Mayer', '2006-09-11', 'Continuum'),
('The Heart of Life', 'John Mayer', '2006-09-11', 'Continuum'),
('Vultures', 'John Mayer', '2006-09-11', 'Continuum'),
('Stop This Train', 'John Mayer', '2006-09-11', 'Continuum'),
('Slow Dancing in a Burning Room', 'John Mayer', '2006-09-11', 'Continuum'),
('Bold as Love', 'John Mayer', '2006-09-11', 'Continuum'),
('Dreaming with a Broken Heart', 'John Mayer', '2006-09-11', 'Continuum'),
('In Repair', 'John Mayer', '2006-09-11', 'Continuum'),
('I\'m Gonna Find Another You', 'John Mayer', '2006-09-11', 'Continuum'),
('No Such Thing', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Why Georgia', 'John Mayer', '2001-08-16', 'Room For Squares'),
('My Stupid Mouth', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Your Body Is a Wonderland', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Neon', 'John Mayer', '2001-08-16', 'Room For Squares'),
('City Love', 'John Mayer', '2001-08-16', 'Room For Squares'),
('83', 'John Mayer', '2001-08-16', 'Room For Squares'),
('3x5', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Love Song for No One', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Back to You', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Great Indoors', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Not Myself', 'John Mayer', '2001-08-16', 'Room For Squares'),
('St. Patrick\'s Day', 'John Mayer', '2001-08-16', 'Room For Squares'),
('Enter Sandman', 'Metallica', '1991-08-12', 'Metallica'),
('Sad But True', 'Metallica', '1991-08-12', 'Metallica'),
('Holier Than Thou', 'Metallica', '1991-08-12', 'Metallica'),
('The Unforgiven', 'Metallica', '1991-08-12', 'Metallica'),
('Wherever I May Roam', 'Metallica', '1991-08-12', 'Metallica'),
('Don\'t Tread on Me', 'Metallica', '1991-08-12', 'Metallica'),
('Through the Never', 'Metallica', '1991-08-12', 'Metallica'),
('Nothing Else Matters', 'Metallica', '1991-08-12', 'Metallica'),
('Of Wolf and Man', 'Metallica', '1991-08-12', 'Metallica'),
('The God That Failed', 'Metallica', '1991-08-12', 'Metallica'),
('My Friend of Misery', 'Metallica', '1991-08-12', 'Metallica'),
('The Struggle Within', 'Metallica', '1991-08-12', 'Metallica'),
('Ain\t My B*tch', 'Metallica', '1996-06-04', 'Load'),
('2 X 4', 'Metallica', '1996-06-04', 'Load'),
('The House Jack Built', 'Metallica', '1996-06-04', 'Load'),
('Until It Sleeps', 'Metallica', '1996-06-04', 'Load'),
('King Nothing', 'Metallica', '1996-06-04', 'Load'),
('Hero Of The Day', 'Metallica', '1996-06-04', 'Load'),
('Bleeding Me', 'Metallica', '1996-06-04', 'Load'),
('Cure', 'Metallica', '1996-06-04', 'Load'),
('Poor Twisted Me', 'Metallica', '1996-06-04', 'Load'),
('Wasting My Hate', 'Metallica', '1996-06-04', 'Load'),
('Mama Said', 'Metallica', '1996-06-04', 'Load'),
('Thorn Within', 'Metallica', '1996-06-04', 'Load'),
('Ronnie', 'Metallica', '1996-06-04', 'Load'),
('The Outlaw Torn', 'Metallica', '1996-06-04', 'Load'),
('Ocean Planet', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Backbone', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('From the Sky', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Unicorn', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Where the Dragons Dwell', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('The Heaviest Matter of the Universe', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Flying Whales', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('In the Wilderness', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('World to Come', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('From Mars', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('To Sirius', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Global Warming', 'Gojira', '2005-09-07', 'From Mars to Sirius'),
('Immigrant Song', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Friends', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Celebration Day', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Since I\'ve Been Loving You', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Out on the Tiles', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Gallows Pole', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Tangerine', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('That\'s the Way', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Bron-Y-Aur Stomp', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('Hatts off To (Roy) Harper', 'Led Zeppelin', '1970-10-05', 'Led Zeppelin III'),
('War Pigs / Luke\'s Wall', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Paranoid', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Planet Caravan', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Iron Man', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Electric Funeral', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Hand of Doom', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Rat Salad', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Jack the Stripper / Fairies Wear Boots', 'Black Sabbath', '1970-09-18', 'Paranoid'),
('Smells Like Teen Spirit', 'Nirvana', '1991-09-26', 'Nevermind'),
('In Bloom', 'Nirvana', '1991-09-26', 'Nevermind'),
('Come As You Are', 'Nirvana', '1991-09-26', 'Nevermind'),
('Breed', 'Nirvana', '1991-09-26', 'Nevermind'),
('Lithium', 'Nirvana', '1991-09-26', 'Nevermind'),
('Polly', 'Nirvana', '1991-09-26', 'Nevermind'),
('Territorial Pissings', 'Nirvana', '1991-09-26', 'Nevermind'),
('Drain You', 'Nirvana', '1991-09-26', 'Nevermind'),
('Lounge Act', 'Nirvana', '1991-09-26', 'Nevermind'),
('Stay Away', 'Nirvana', '1991-09-26', 'Nevermind'),
('On A Plain', 'Nirvana', '1991-09-26', 'Nevermind'),
('Something In The Way', 'Nirvana', '1991-09-26', 'Nevermind'),
('Endless, Nameless', 'Nirvana', '1991-09-26', 'Nevermind'),
('Once', 'Pearl Jam', '1991-08-27', 'Ten'),
('Even Flow', 'Pearl Jam', '1991-08-27', 'Ten'),
('Alive', 'Pearl Jam', '1991-08-27', 'Ten'),
('Why Go', 'Pearl Jam', '1991-08-27', 'Ten'),
('Black', 'Pearl Jam', '1991-08-27', 'Ten'),
('Jeremy', 'Pearl Jam', '1991-08-27', 'Ten'),
('Oceans', 'Pearl Jam', '1991-08-27', 'Ten'),
('Porch', 'Pearl Jam', '1991-08-27', 'Ten'),
('Garden', 'Pearl Jam', '1991-08-27', 'Ten'),
('Deep', 'Pearl Jam', '1991-08-27', 'Ten'),
('Release', 'Pearl Jam', '1991-08-27', 'Ten'),
('Them Bones', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Dam That River', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Rain When I Die', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Down In A Hole', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Sickman', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Rooster', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Junkhead', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Dirt', 'Alice in Chains', '1992-09-29', 'Dirt'),
('God Smack', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Untitled', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Hate To Feel', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Angry Chair', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Would?', 'Alice in Chains', '1992-09-29', 'Dirt'),
('Cowboys from Hell', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Primal Concrete Sledge', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Psycho Holiday', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Heresy', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Cemetery Gates', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Domination', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Shattered', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Clash with Reality', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Message in Blood', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('Medicine Man', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('The Sleep', 'Pantera', '1990-07-20', 'Cowboys from Hell'),
('The Art of Shredding', 'Pantera', '1990-07-20', 'Cowboys from Hell');

insert into Single values
('Cowboys from Hell', '1990-04-05'),
('Enter Sandman', '1991-06-10'),
('Smells Like Teen Spirit', '1991-08-10'),
('Domination', '1990-04-12'),
('Come As You Are', '1991-07-15'),
('Rooster', '1992-08-13'),
('Even Flow', '1991-07-10'),
('Jeremy', '1991-06-12'),
('Down In a Hole', '1992-07-18'),
('Oblivion', '2009-01-20'),
('Blood and Thunder', '2004-07-05'),
('Gravity', '2006-08-10'),
('The Drapery Falls', '2001-01-26'),
('Immigrant Song', '1970-02-03'),
('Black', '1991-06-10'),
('Hero Of The Day', '1996-05-05'),
('Flying Whales', '2005-04-10'),
('Paranoid', '1970-04-22'),
('Megalodon', '2004-03-16'),
('Backbone', '2005-03-01'),
('From the Sky', '2005-03-08'),
('Ocean Planet', '2005-03-28');

insert into Genre values
('Progressive Metal'),
('Death Metal'),
('Grunge'),
('Alternative Rock'),
('Thrash Metal'),
('Rock'),
('Groove Metal'),
('Technical Death Metal'),
('Pop');

insert into Song_Genre values
('Cowboys from Hell', 'Groove Metal'),
('Enter Sandman', 'Thrash Metal'),
('Smells Like Teen Spirit', 'Grunge'),
('Domination', 'Groove Metal'),
('Come As You Are', 'Grunge'),
('Rooster', 'Grunge'),
('Even Flow', 'Grunge'),
('Jeremy', 'Grunge'),
('Down In a Hole', 'Grunge'),
('Oblivion', 'Progressive Metal'),
('Blood and Thunder', 'Progressive Metal'),
('Gravity', 'Pop'),
('The Drapery Falls', 'Progressive Metal'),
('Immigrant Song', 'Rock'),
('Black', 'Grunge'),
('Hero Of The Day', 'Rock'),
('Flying Whales', 'Progressive Metal'),
('Paranoid', 'Rock'),
('Megalodon', 'Progressive Metal'),
('Backbone', 'Progressive Metal'),
('From the Sky', 'Progressive Metal'),
('Ocean Planet', 'Progressive Metal');

insert into MusicUser values
('Metalhead400'),
('MattKilleen97'),
('SameerAhmed99'),
('Ilovemusic69');

insert into Playlist values
('MattKilleen97', 'Headbangers', '2020-05-07'),
('MattKilleen97', 'Fav Gojira Songs', '2021-11-20'),
('Metalhead400', 'My Metal', '2018-04-12'),
('SameerAhmed99', 'Top songs', '2018-07-22'),
('Ilovemusic69', 'My Top Music', 2015-12-30);

insert into PlaylistSongs values
('Headbangers', 'Backbone'),
('Headbangers', 'The Heaviest Matter of the Universe'),
('Headbangers', 'Domination'),
('Headbangers', 'Crusher Destroyer'),
('Headbangers', 'Flying Whales'),
('Headbangers', 'Enter Sandman'),
('Fav Gojira Songs', 'Backbone'),
('Fav Gojira Songs', 'Flying Whales'),
('Fav Gojira Songs', 'The Heaviest Matter of the Universe'),
('My Metal', 'Domination'),
('My Metal', 'Enter Sandman'),
('My Metal', 'The Unforgiven'),
('My Metal', 'Crusher Destroyer'),
('My Metal', 'Backbone'),
('My Metal', 'Flying Whales'),
('Top songs', 'Domination'),
('Top songs', 'Even Flow'),
('Top songs', 'Jeremy'),
('Top songs', 'Enter Sandman'),
('Top songs', 'The Unforgiven'),
('My Top Music', 'Enter Sandman'),
('My Top Music', 'Even Flow'),
('My Top Music', 'The Unforgiven');

insert into SongRating values
('Metalhead400', 'Backbone', 4),
('MattKilleen97', 'Enter Sandman', 5),
('MattKilleen97', 'Even Flow', 4),
('Metalhead400', 'Jeremy', 3),
('Metalhead400', 'Sad But True', 5),
('MattKilleen97', 'Sad But True', 4),
('SameerAhmed99', 'King Nothing', 5),
('MattKilleen97', 'Rooster', 5),
('MattKilleen97', 'Smells Like Teen Spirit', 5),
('MattKilleen97', 'In Bloom', 4),
('SameerAhmed99', 'Come As You Are', 4),
('MattKilleen97', 'Oblivion', 5),
('MattKilleen97', 'Paranoid', 4),
('MattKilleen97', 'Immigrant Song', 5),
('MattKilleen97', 'Domination', 5);

insert into AlbumRating values
('MattKilleen97', 'Nevermind', 3),
('MattKilleen97', 'Metallica', 5),
('MattKilleen97', 'Dirt', 4),
('MattKilleen97', 'Ten', 4),
('MattKilleen97', 'Load', 2),
('MattKilleen97', 'Cowboys from Hell', 5),
('MattKilleen97', 'Still Life', 5),
('MattKilleen97', 'Far Beyond Driven', 5),
('MattKilleen97', 'Vs.', 4),
('MattKilleen97', 'Vitalogy', 3),
('MattKilleen97', 'In Utero', 2),
('SameerAhmed99', 'Facelife', 3),
('SameerAhmed99', 'Cowboys from Hell', 5),
('SameerAhmed99', 'Still Life', 5),
('SameerAhmed99', 'Far Beyond Driven', 5),
('SameerAhmed99', 'Vs.', 4),
('SameerAhmed99', 'Vitalogy', 3),
('SameerAhmed99', 'In Utero', 2),
('SameerAhmed99', 'Facelife', 3);

select * from SongRating;

-- Here when done (this is just to insert data to test the database) will delete up to here when done

-- WRITE QUERIES BELOW HERE --
