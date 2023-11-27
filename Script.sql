-------------- Music
create table if not exists Genre (
	genre_id SERIAL primary key,
	genre_name VARCHAR(30) unique not null
);

create table if not exists Artist (
	artist_id SERIAL primary key,
	nickname VARCHAR(30) not null,
	genre_id INTEGER
);

create table if not exists GenreArtist (
	genre_id INTEGER not null references Genre(genre_id),
	artist_id INTEGER not null references Artist(artist_id),
	CONSTRAINT pk primary key(genre_id, artist_id)
	
);

create table if not exists Album (
	album_id SERIAL primary key,
	album_name VARCHAR(60) not null,
	artist_id INTEGER not null references Artist(artist_id),
	year DECIMAL(4,0) not null,
	tracks text not null
);

create table if not exists AlbumArtist (
	album_artist_id SERIAL primary key,
	album_id INTEGER not null references Album(album_id),
	artist_id INTEGER not null references Artist(artist_id)
);

create table if not exists Track (
	track_id SERIAL primary key,
	album_id INTEGER not null references Album(album_id),
	duration INTEGER not null
);

alter table if not exists Track add column name VARCHAR(60) not null;

create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	year_of_release DECIMAL(4,0) not null
);

drop table if exists CrossCollection;

create table if not exists CrossCollection (
	track_id INTEGER not null references Track(track_id), 
	album_id INTEGER not null references Collection(id),
	constraint pkey primary key(track_id, album_id)
);
alter table crosscollection rename album_id to collection_id;
-----------
insert into Genre(genre_name)
values('Rock-n-Roll');

insert into genre(genre_name)
values('Heavy_Metall');

insert into genre(genre_name)
values('Rap');

insert into genre(genre_name)
values('Country');
------------
insert into artist
values(1, 'Elvis P.', 1);
insert into artist
values(2, 'Ozzy Ozborne', 2);
insert into artist
values(3, 'Metallica', 2);
insert into artist
values(4, 'Eminem', 3)
------------
insert into album 
values(1, 'Blizzard of Ozz', 2, 1980, '	"I Dont Know", "Crazy Train", "Goodbye to Romance", "Dee"');
insert into album 
values(2, 'Ride the Lightning', 3, 1984, '	"Fight Fire with Fire", "Ride the Lightning", "For Whom the Bell Tolls"');
insert into album 
values(3, 'Master of Puppets', 3, 1986, '	"Battery", "Master of Puppets", "Orion"');
------------
insert into track
values(1, 1, 5, 'I Dont Know');
insert into track
values(2, 1, 4, 'Crazy Train');
insert into track
values(3, 1, 6, 'Goodbye to Romance');
insert into track
values(4, 1, 1, 'Dee');

insert into track
values(5, 2, 4, 'Fight Fire with Fire');
insert into track
values(6, 2, 6, 'Ride the Lightning');
insert into track
values(7, 2, 5, 'For Whom the Bell Tolls');

insert into track
values(8, 3, 5, 'Battery');
insert into track
values(9, 3, 8, 'Master of Puppets');
insert into track
values(10, 3, 8, 'Orion');
------------
insert into Collection
values(1, 'Metallica Collection', 2020);
insert into Collection
values(2, 'Metallica 1 + Ozzy *', 2020);
insert into Collection
values(3, 'Metallica * + Ozzy 1', 2020);
------------

insert into crosscollection 
values(5, 1);
insert into crosscollection 
values(6, 1);
insert into crosscollection 
values(7, 1);
insert into crosscollection 
values(8, 1);
insert into crosscollection 
values(9, 1);
insert into crosscollection 
values(10, 1);

insert into crosscollection 
values(5, 2);
insert into crosscollection 
values(1, 2);
insert into crosscollection 
values(2, 2);
insert into crosscollection 
values(3, 2);
insert into crosscollection 
values(4, 2);

insert into crosscollection 
values(5, 3);
insert into crosscollection 
values(6, 3);
insert into crosscollection 
values(7, 3);
insert into crosscollection 
values(8, 3);
insert into crosscollection 
values(9, 3);
insert into crosscollection 
values(10, 3);
insert into crosscollection 
values(1, 3);




