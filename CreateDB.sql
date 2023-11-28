-------------- Music
create table if not exists Genre (
	genre_id SERIAL primary key,
	genre_name VARCHAR(30) unique not null
);

create table if not exists Artist (
	artist_id SERIAL primary key,
	nickname VARCHAR(30) not null
);

create table if not exists GenreArtist (
	genre_id INTEGER not null references Genre(genre_id),
	artist_id INTEGER not null references Artist(artist_id),
	CONSTRAINT pk primary key(genre_id, artist_id)
	
);

create table if not exists Album (
	album_id SERIAL primary key,
	album_name VARCHAR(60) not null,
	artist_id INTEGER references Artist(artist_id),
	year DECIMAL(4,0) not null
);


create table if not exists AlbumArtist (
	album_id INTEGER not null references Album(album_id),
	artist_id INTEGER not null references Artist(artist_id),
	constraint pkey primary key(album_id, artist_id)
);

create table if not exists Track (
	track_id SERIAL primary key,
	album_id INTEGER references Album(album_id),
	duration INTEGER,
	name VARCHAR(60) not null
);


create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	year_of_release DECIMAL(4,0) not null
);

create table if not exists CrossCollection (
	track_id INTEGER not null references Track(track_id), 
	collection_id INTEGER not null references Collection(id),
	constraint prkey primary key(track_id, collection_id)
);
