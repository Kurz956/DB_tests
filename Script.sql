-- 1 to 1 (vol.1)

create table if not EXISTS Student (
	email VARCHAR(80) primary key,
	name VARCHAR(40) not null,
	password VARCHAR(128) not null
);

create table if not EXISTS StudentInfo (
	email VARCHAR(80) primary key REFERENCES Student(email),
	birthday date,
	city VARCHAR(60),
	roi TEXT
);

-- 1 to 1 (vol.2)
create table if not exists Student (
	id SERIAL primary key,
	email VARCHAR(80) unique not null,
	name VARCHAR(40) not null,
	password VARCHAR(128) not null
);

create table if not exists StudentInfo(
	id INTEGER primary key references Student(id),
	birthday date,
	city VARCHAR(60),
	roi TEXT
);
-------------- Whos're boss ya?
create table if not exists Employee (
	employee_id SERIAL primary key,
	name VARCHAR(30) not null,
	department VARCHAR(30)
);

create table if not exists Boss (
	boss_id SERIAL primary key,
	employee_id INTEGER unique not null references Employee(employee_id)
);

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
